#!/usr/bin/env bash
# ci_build_and_test.sh
# This script is intended to run inside the container built from the Dockerfile above.
# It will:
#  - try to install pinned/required OS packages (with retries)
#  - attempt fallbacks (download .deb packages) for critical legacy packages
#  - prepare Python environment and install Python deps
#  - build/install the project and run its tests
#
# Notes:
#  - The script is defensive: it retries apt operations and logs attempts.
#  - Tests are executed at the end; the script exits with the tests' exit code.
set -o errexit
set -o nounset
set -o pipefail

RETRY_COUNT=5
SLEEP_BETWEEN_RETRIES=5

apt_update_retry() {
  local n=0
  until [ $n -ge $RETRY_COUNT ]
  do
    echo "Attempting apt-get update (try $((n+1))/$RETRY_COUNT)..."
    if apt-get update -y; then
      return 0
    fi
    n=$((n+1))
    sleep $SLEEP_BETWEEN_RETRIES
  done
  echo "apt-get update failed after $RETRY_COUNT attempts"
  return 1
}

apt_install_retry() {
  local pkgs=("$@")
  local n=0
  until [ $n -ge $RETRY_COUNT ]
  do
    echo "Attempting apt-get install -y ${pkgs[*]} (try $((n+1))/$RETRY_COUNT)..."
    if apt-get install -y --no-install-recommends "${pkgs[@]}"; then
      return 0
    fi
    n=$((n+1))
    apt_update_retry || true
    sleep $SLEEP_BETWEEN_RETRIES
  done
  echo "apt-get install failed for: ${pkgs[*]}"
  return 1
}

dpkg_install_deb() {
  local url="$1"
  local dest="/tmp/$(basename "$url")"
  echo "Downloading .deb from $url ..."
  if curl -fsSL -o "$dest" "$url"; then
    echo "Installing $dest ..."
    dpkg -i "$dest" || apt-get -fy install -y
    rm -f "$dest"
    return 0
  else
    echo "Failed to download $url"
    return 1
  fi
}

echo "=== Starting CI build & test script ==="
echo "Working directory: $(pwd)"
echo "Listing top-level files:"
ls -la ..

# 1) Ensure apt is usable
apt_update_retry

# 2) Attempt to install primary packages (should succeed in most environments)
PRIMARY_PKGS=(
  python3
  python3-pip
  python3-dev
  python3-setuptools
  python3-venv
  python3-nacl
  build-essential
  wget
  curl
  gnupg
  apt-transport-https
  ca-certificates
  jq
  libgflags-dev
  libsnappy-dev
  zlib1g-dev
  libbz2-dev
  liblz4-dev
  zstd
  ruby
  ruby-dev
  rubygems
  gcc
  make
  pkg-config
)

echo "Installing primary packages..."
if ! apt_install_retry "${PRIMARY_PKGS[@]}"; then
  echo "Warning: primary apt-get install failed; continuing with best-effort fallbacks."
fi

# 3) Try to install pinned/legacy packages that are known to be problematic.
#    If apt cannot get them from the configured repos, attempt .deb fallback downloads.
PINNED_PKGS=(libgflags-dev libsnappy-dev)  # already included; placeholder for ordering

# Legacy/pinned packages used by Indy (may require the hyperledger/sovrin repos)
# These versions are used in upstream CI; some may not be available on newer Ubuntu without the bionic/focal repos.
LEGACY_PKGS=(libssl1.0.0 ursa=0.3.2-1 libindy=1.15.0~1625-bionic rocksdb=5.8.8 librocksdb5.17 librocksdb-dev python-rocksdb)

echo "Attempting to install legacy/pinned packages (may fail if repos unavailable)..."
if apt_install_retry "${LEGACY_PKGS[@]}"; then
  echo "Legacy packages installed via apt"
else
  echo "apt install for legacy packages failed; attempting .deb fallbacks for the most critical items."

  # Try to get libssl1.0.0 from Ubuntu archive (bionic or focal compat). URL may change over time; attempt common mirrors.
  # These URLs are best-effort fallbacks; if they fail, we continue.
  # IMPORTANT: The exact package versions available may vary. These are common known locations.
  dpkg_install_deb "http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.0.0_1.0.2n-1ubuntu5.9_amd64.deb" || true
  dpkg_install_deb "http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.0.0_1.0.2n-1ubuntu5.9_amd64.deb" || true

  # Try to download libindy/ursa from hyperledger artifactory / sovrin repo (best-effort).
  # NOTE: Replace versions/URLs below if your environment uses different build artifacts.
  dpkg_install_deb "https://hyperledger.jfrog.io/artifactory/indy/deb/pool/main/libi/libindy/libindy_1.15.0~1625-bionic_amd64.deb" || true
  dpkg_install_deb "https://repo.sovrin.org/deb/pool/main/u/ursa/ursa_0.3.2-1_amd64.deb" || true

  # Try rocksdb .deb (common package names vary); fallback to installing librocksdb-dev via apt if present
  dpkg_install_deb "https://launchpad.net/~ubuntu-toolchain-test/+archive/ubuntu/ubuntu/+files/librocksdb5.17_5.8.8-1_amd64.deb" || true

  # If dpkg installs produced broken deps, attempt to fix them
  apt-get -fy install -y || true
fi

# 4) Ensure pip and some Python build-time deps are correct versions (from CI hints)
echo "Upgrading pip and installing pinned Python build dependencies..."
python3 -m pip install --upgrade pip setuptools==50.3.2 Cython==0.29.36 pyzmq==22.3.0 wheel || true

# 5) Install project Python dependencies (editable install + tests extras)
#    Use --no-cache-dir to keep image smaller and avoid cached corrupt packages.
echo "Installing project (and test extras) via pip..."
# Some environments require building wheels with system libs installed. We attempt pip install and continue even if some binary extensions fail.
python3 -m pip install --no-cache-dir -U .
# Try tests extras; if python3-indy is unavailable as a wheel, it may fail. Continue anyway.
python3 -m pip install --no-cache-dir ".[tests]" || true

# 6) Install any additional gems/tools used by CI packaging (optional)
echo "Installing gem tools (fpm helpers if packaging is needed)..."
gem install --no-document fpm || true

# 7) Run tests
echo "Running test suite (pytest) ..."
# We run pytest in the repository root. Tests may be heavy; run default invocation.
# If pytest is not installed in tests extras, try to install it.
python3 -m pip install --no-cache-dir pytest pytest-xdist pytest-forked pytest-asyncio || true

# Run pytest and capture exit code (do not mask tests result)
pytest -q || TEST_EXIT_CODE=$? || TEST_EXIT_CODE=1
TEST_EXIT_CODE=${TEST_EXIT_CODE:-0}

echo "=== Test run finished with exit code: $TEST_EXIT_CODE ==="

# Exit with the test run exit code so CI can see pass/fail.
exit $TEST_EXIT_CODE