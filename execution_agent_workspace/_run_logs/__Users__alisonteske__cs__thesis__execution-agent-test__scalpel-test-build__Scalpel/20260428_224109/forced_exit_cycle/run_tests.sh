#!/usr/bin/env bash
# run_tests.sh - setup environment, install dependencies, build project, run tests
# This script is intended to be executed inside the container at /app/<project-dir>
set -euo pipefail

echo "=== run_tests.sh: START ==="
echo "Working directory: $(pwd)"
PROJECT_DIR="$(pwd)"
VENV_DIR=".venv"

# Ensure pip, setuptools and wheel are available system-wide before creating venv
# (addresses common 'pkg_resources' / setuptools missing issues)
echo "Upgrading system pip, setuptools and wheel..."
python3 -m pip install --upgrade pip setuptools wheel || {
  echo "Warning: system pip upgrade failed - continuing, but this may cause issues"
}

# Create and activate virtual environment
if [ -d "${VENV_DIR}" ]; then
  echo "Virtualenv ${VENV_DIR} already exists, reusing it."
else
  echo "Creating virtualenv at ${VENV_DIR}..."
  python3 -m venv "${VENV_DIR}"
fi

# shellcheck source=/dev/null
source "${VENV_DIR}/bin/activate"

echo "Virtualenv activated: $(which python) ($(python --version))"
pip install --upgrade pip setuptools wheel

# Install project requirements if present
if [ -f requirements.txt ]; then
  echo "Installing requirements from requirements.txt..."
  if ! pip install -r requirements.txt; then
    echo "Warning: pip install -r requirements.txt failed. Attempting to continue (some optional deps may be missing)."
  fi
else
  echo "No requirements.txt found; skipping."
fi

# Try to install the project in editable mode (preferred).
echo "Installing project (editable mode)..."
if ! pip install -e .; then
  echo "pip install -e . failed. Trying pip install . (non-editable)..."
  if ! pip install .; then
    echo "Warning: project installation failed. Tests may still run but are likely to fail."
  fi
fi

# Ensure pytest is available
echo "Installing pytest (if not already present)..."
pip install pytest || {
  echo "Warning: pytest installation failed. Proceeding (may be installed already)."
}

# Sanity check installed packages
echo "Installed packages (top):"
pip list --format=columns | sed -n '1,200p'

# Export PYTHONPATH so local package modules are importable even if editable install had issues
export PYTHONPATH="${PROJECT_DIR}:${PYTHONPATH:-}"
echo "PYTHONPATH set to: ${PYTHONPATH}"

# Run pip check to surface dependency problems (non-fatal)
if pip check; then
  echo "pip check: OK"
else
  echo "pip check reported conflicts or missing dependencies (continuing)."
fi

# Run tests. Use python -m pytest tests to mirror CI.
echo "Running test suite with pytest..."
# The exit code from pytest will be returned by the script so failure is visible to callers.
python -m pytest tests

echo "=== run_tests.sh: END ==="