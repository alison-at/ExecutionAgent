#!/usr/bin/env bash
#
# Auto-generated bash script from execution agent trace
# Project: /Users/alisonteske/IrisTest/iris
#
# This script reproduces the actions taken by the execution agent
#

set -e  # Exit on error
set -u  # Exit on undefined variable

# Configuration
DOCKER_TAG='tooliris_image:executionagent-1777588859-2986dc15'
CONTAINER_ID=''

# Cleanup function
cleanup() {
  if [ -n "$CONTAINER_ID" ]; then
    echo 'Cleaning up container: $CONTAINER_ID'
    docker stop $CONTAINER_ID >/dev/null 2>&1 || true
    docker rm $CONTAINER_ID >/dev/null 2>&1 || true
  fi
}

# Register cleanup on exit
trap cleanup EXIT

echo '========================================='
echo 'Starting execution agent trace replay'
echo '========================================='

# ============================================
# File writes
# ============================================

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/iris/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/iris/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/iris/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git curl wget && rm -rf /var/lib/apt/lists/* \
    && wget --quiet https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O /tmp/miniforge.sh \
    && chmod +x /tmp/miniforge.sh \
    && /tmp/miniforge.sh -b -p /opt/conda \
    && rm /tmp/miniforge.sh

ENV PATH="/opt/conda/bin:$PATH"

WORKDIR /app

RUN git clone https://github.com/iris-sast/iris.git .

RUN wget https://raw.githubusercontent.com/iris-sast/iris/main/environment.yml

RUN conda env create -f environment.yml

CMD ["/bin/bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/iris/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/iris/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/iris/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git curl wget && rm -rf /var/lib/apt/lists/* \
    && wget --quiet https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh -O /tmp/miniforge.sh \
    && chmod +x /tmp/miniforge.sh \
    && /tmp/miniforge.sh -b -p /opt/conda \
    && rm /tmp/miniforge.sh

ENV PATH="/opt/conda/bin:$PATH"

WORKDIR /app

RUN git clone https://github.com/iris-sast/iris.git .

RUN wget https://raw.githubusercontent.com/iris-sast/iris/main/environment.yml

RUN conda env create -f environment.yml

CMD ["/bin/bash"]
EOF_FILE

# ============================================
# Docker image build and container start
# ============================================

# Building Docker image: tooliris_image:executionagent-1777588859-2986dc15
echo 'Building Docker image: tooliris_image:executionagent-1777588859-2986dc15'
docker build -t 'tooliris_image:executionagent-1777588859-2986dc15' '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/iris/Dockerfile_path'
BUILD_STATUS=$?
if [ $BUILD_STATUS -ne 0 ]; then
  echo 'ERROR: Docker build failed with exit code $BUILD_STATUS'
  exit $BUILD_STATUS
fi
DOCKER_TAG='tooliris_image:executionagent-1777588859-2986dc15'

# Starting Docker container from image: tooliris_image:executionagent-1777588859-2986dc15
echo 'Starting Docker container from image: tooliris_image:executionagent-1777588859-2986dc15'
CONTAINER_ID=$(docker run -d -t 'tooliris_image:executionagent-1777588859-2986dc15' tail -f /dev/null)
START_STATUS=$?
if [ $START_STATUS -ne 0 ]; then
  echo 'ERROR: Failed to start container'
  exit $START_STATUS
fi
echo 'Container started with ID: $CONTAINER_ID'

# ============================================
# Command execution
# ============================================

# Executing in container: conda env create -f environment.yml
echo 'Executing: conda env create -f environment.yml'
docker exec $CONTAINER_ID bash -lc 'conda env create -f environment.yml'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: conda activate iris
echo 'Executing: conda activate iris'
docker exec $CONTAINER_ID bash -lc 'conda activate iris'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: conda init
echo 'Executing: conda init'
docker exec $CONTAINER_ID bash -lc 'conda init'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: exec "$SHELL" -l
echo 'Executing: exec "$SHELL" -l'
docker exec $CONTAINER_ID bash -lc 'exec "$SHELL" -l'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: conda activate iris
echo 'Executing: conda activate iris'
docker exec $CONTAINER_ID bash -lc 'conda activate iris'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: conda list
echo 'Executing: conda list'
docker exec $CONTAINER_ID bash -lc 'conda list'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest
echo 'Executing: pytest'
docker exec $CONTAINER_ID bash -lc pytest
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install pytest
echo 'Executing: pip install pytest'
docker exec $CONTAINER_ID bash -lc 'pip install pytest'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest
echo 'Executing: pytest'
docker exec $CONTAINER_ID bash -lc pytest
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: tree
echo 'Executing: tree'
docker exec $CONTAINER_ID bash -lc tree
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls -la
echo 'Executing: ls -la'
docker exec $CONTAINER_ID bash -lc 'ls -la'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: cat environment.yml
echo 'Executing: cat environment.yml'
docker exec $CONTAINER_ID bash -lc 'cat environment.yml'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: conda env create -f environment.yml
echo 'Executing: conda env create -f environment.yml'
docker exec $CONTAINER_ID bash -lc 'conda env create -f environment.yml'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: conda activate iris
echo 'Executing: conda activate iris'
docker exec $CONTAINER_ID bash -lc 'conda activate iris'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest
echo 'Executing: pytest'
docker exec $CONTAINER_ID bash -lc pytest
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: find . -name "*.py"
echo 'Executing: find . -name "*.py"'
docker exec $CONTAINER_ID bash -lc 'find . -name "*.py"'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls -la tests
echo 'Executing: ls -la tests'
docker exec $CONTAINER_ID bash -lc 'ls -la tests'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls -la src
echo 'Executing: ls -la src'
docker exec $CONTAINER_ID bash -lc 'ls -la src'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: cat iris.py
echo 'Executing: cat iris.py'
docker exec $CONTAINER_ID bash -lc 'cat iris.py'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: find . -name "iris.py"
echo 'Executing: find . -name "iris.py"'
docker exec $CONTAINER_ID bash -lc 'find . -name "iris.py"'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --help
echo 'Executing: python ./src/iris.py --help'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --help'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project --project my_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project --project my_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project --project my_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project --project my_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project --project my_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project --project my_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project --project test_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project --project test_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project --project test_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project --project test_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project --project test_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project --project test_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project --project my_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project --project my_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project --project my_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project my_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project my_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project my_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls -la src
echo 'Executing: ls -la src'
docker exec $CONTAINER_ID bash -lc 'ls -la src'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python ./src/iris.py --query test_query --run-id test_project
echo 'Executing: python ./src/iris.py --query test_query --run-id test_project'
docker exec $CONTAINER_ID bash -lc 'python ./src/iris.py --query test_query --run-id test_project'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# ============================================
# Execution complete
# ============================================

echo '========================================='
echo 'Execution agent trace replay complete'
echo '========================================='

# Note: Container is still running. Use 'docker exec $CONTAINER_ID bash' to access it.
# To stop and remove the container, press Ctrl+C or let the script exit naturally.