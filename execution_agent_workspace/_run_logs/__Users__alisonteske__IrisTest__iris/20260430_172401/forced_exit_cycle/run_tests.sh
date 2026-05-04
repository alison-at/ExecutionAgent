#!/bin/bash

# Activate the iris conda environment
source /opt/conda/etc/profile.d/conda.sh
conda activate iris

# Navigate to the source directory and run tests
cd src

# Running the tests (replace {CWE} and {project_slug} with valid arguments as needed)
python iris.py --query <VALID_CWE> --run-id test --overwrite-api-candidates --overwrite-func-param-candidates --skip-posthoc-filter <VALID_PROJECT_SLUG> || true

# end of script