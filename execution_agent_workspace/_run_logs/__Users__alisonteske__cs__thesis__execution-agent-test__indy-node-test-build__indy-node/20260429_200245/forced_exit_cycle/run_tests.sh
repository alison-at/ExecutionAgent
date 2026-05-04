#!/usr/bin/env bash
# run_in_container.sh
# This script is intended to be executed inside the container built from the Dockerfile above.
# It installs Python/test dependencies, builds the project (editable install), and runs the test suite.
# It tries multiple fallbacks for known problematic dependencies (rocksdb, python3-indy/libindy).
set -euo pipefail
IFS=$'\n\t'

REPO_DIR=${REPO_DIR:-/app/indy-node}
PYTHON=python3
PIP="python3 -m pip"
NUM_JOBS=${NUM_JOBS:-2}

echo "Starting container setup and test run"
echo "Repository directory: $REPO_DIR"
echo "Using Python: $($PYTHON --version 2>&1 || true)"

# Ensure pip is available and up-to-date
echo "Upgrading pip and installing build-time python packages..."
$PIP install --no-cache-dir -U pip wheel || true
$PIP install --no-cache-dir setuptools==50.3.2 "pyzmq==22.3.0" "Cython==0.29.36" || true

# Sanity: show which pip packages exist
echo "Installed pip packages (top):"
$PIP list --format=columns | head -n 40 || true

# Enter repository
if [ ! -d "$REPO_DIR" ]; then
  echo "Repository not found at $REPO_DIR; attempting to clone from env REPO_URL..."
  REPO_URL=${REPO_URL:-https://github.com/hyperledger-indy/indy-node}
  git clone --depth 1 "$REPO_URL" "$REPO_DIR"
fi
cd "$REPO_DIR"

echo "Repository HEAD:"
git rev-parse --short HEAD || true
ls -la

# Set PYTHONPATH so local imports work if needed
export PYTHONPATH="$PWD:$PYTHONPATH"

# Ensure system headers for rocksdb exist; if not, warn.
if ! dpkg -s librocksdb-dev >/dev/null 2>&1; then
  echo "Warning: librocksdb-dev is not installed via apt. Installing may be required for python-rocksdb to build."
else
  echo "librocksdb-dev appears installed."
fi

# Try to install the package in editable mode with test extras.
# This will attempt to install python3-indy and other extras; if that fails, fall back to partial installs.
echo "Attempting: pip install -e .[tests] (this may fail if system libs like libindy/python3-indy are missing)"
if $PIP install --no-cache-dir -e .[tests]; then
  echo "Package and test extras installed successfully."
else
  echo "pip install .[tests] failed. Attempting fallbacks."

  # 1) Install package itself (editable) without extras
  echo "Installing package in editable mode without extras..."
  $PIP install --no-cache-dir -e . || true

  # 2) Install common test tooling explicitly
  echo "Installing common test dependencies explicitly via pip..."
  $PIP install --no-cache-dir pytest pytest-asyncio pytest-xdist pytest-forked attrs timeout-decorator distro || true

  # 3) Try to install python-rocksdb (often the troublesome package)
  echo "Attempting to pip install python-rocksdb (may compile from source; ensure librocksdb-dev is installed)..."
  if $PIP install --no-cache-dir python-rocksdb; then
    echo "python-rocksdb installed."
  else
    echo "python-rocksdb installation failed. Tests may still run but could fail on imports requiring rocksdb."
  fi

  # 4) If python3-indy is required but not available via pip, attempt to let tests run without it.
  echo "Note: python3-indy / libindy are system packages often required by tests. If they are missing, some tests will fail."
fi

# Optional: run a quick lint/collect to detect missing imports before running full test suite
echo "Running a quick import smoke-test for core indy_node modules..."
python3 - <<'PYCODE' || true
import sys
try:
    import indy_node
    print("Imported package indy_node:", getattr(indy_node, '__version__', 'no __version__'))
except Exception as e:
    print("Could not import indy_node package:", e)
try:
    from indy_node import server
    print("Imported indy_node.server OK")
except Exception as e:
    print("Could not import indy_node.server:", e)
PYCODE

# Run the test suite. Use -k to avoid extremely long integration tests if needed; here we run all tests.
# If you want to limit or skip slow tests, modify this command (e.g., -k "not slow").
echo "Running pytest..."
# Use -x to stop on first failure to make debug faster; remove it to run the whole suite regardless of failures.
# Keep verbosity high for debugging.
# We run with python -m pytest to ensure the correct interpreter is used.
set +e
python3 -m pytest -l -vv
TEST_EXIT_CODE=$?
set -e

echo "pytest finished with exit code: $TEST_EXIT_CODE"

# Exit with pytest exit code so CI can capture results (the container will exit with this code).
exit $TEST_EXIT_CODE