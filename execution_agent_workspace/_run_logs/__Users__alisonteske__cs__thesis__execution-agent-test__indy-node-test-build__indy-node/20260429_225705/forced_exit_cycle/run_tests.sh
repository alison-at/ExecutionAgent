#!/usr/bin/env bash
# run_tests.sh - installs project dependencies, builds the project, and runs tests inside the container
# Usage: inside the container run: /bin/bash /app/indy-node/run_tests.sh
set -euo pipefail

REPO_DIR="/app/indy-node"
VENV_DIR="${REPO_DIR}/.venv"

echo "Starting run_tests.sh"
echo "Repository directory: ${REPO_DIR}"

if [ ! -d "${REPO_DIR}" ]; then
  echo "ERROR: Repository directory ${REPO_DIR} not found. Did you mount/clone the repo into the container?"
  exit 1
fi

cd "${REPO_DIR}"

# Ensure Python version is adequate
PY_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
echo "Detected python version: ${PY_VERSION}"
python_major=$(python3 -c 'import sys; print(sys.version_info[0])')
python_minor=$(python3 -c 'import sys; print(sys.version_info[1])')
if [ "${python_major}" -lt 3 ] || { [ "${python_major}" -eq 3 ] && [ "${python_minor}" -lt 8 ]; }; then
  echo "ERROR: Python >= 3.8 is required. Detected ${PY_VERSION}."
  exit 2
fi

# Create and activate a virtualenv to avoid modifying system Python packages
if [ ! -d "${VENV_DIR}" ]; then
  echo "Creating virtualenv at ${VENV_DIR}"
  python3 -m venv "${VENV_DIR}"
fi

# shellcheck disable=SC1091
source "${VENV_DIR}/bin/activate"

# Upgrade pip/wheel inside venv
pip install --upgrade pip wheel setuptools==50.3.2

# Pre-install critical Python packages that often require native libs (helps avoid cryptic build failures)
echo "Installing build-time Python packages (pyzmq, Cython, packaging)..."
pip install --no-cache-dir "pyzmq==22.3.0" "Cython==0.29.36" packaging

# Try to install the project including test extras. This may fail if some pinned system libs are missing
echo "Installing project (including [tests] extras)..."
if ! pip install --no-cache-dir ".[tests]"; then
  echo "Warning: pip install .[tests] failed. Attempting to continue and run tests where possible."
  echo "Installing minimal test runner (pytest) to be able to run tests directly..."
  pip install --no-cache-dir pytest pytest-asyncio pytest-xdist pytest-forked || true
fi

# Ensure PYTHONPATH includes repo root so tests can import local modules if package isn't installed
export PYTHONPATH="${REPO_DIR}:${PYTHONPATH:-}"

# Run tests. We run the test suite and allow tests to fail—the script will exit with pytest's exit code.
echo "Running pytest (tests/). This will run all tests discovered under tests/."
if [ -d "${REPO_DIR}/tests" ]; then
  pytest -q tests || exit $?
else
  echo "No tests/ directory detected. Attempting to run 'pytest' to discover tests elsewhere."
  pytest -q || exit $?
fi

echo "run_tests.sh completed."