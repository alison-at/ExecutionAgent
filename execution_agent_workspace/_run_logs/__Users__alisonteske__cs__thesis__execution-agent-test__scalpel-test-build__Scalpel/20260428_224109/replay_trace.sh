#!/usr/bin/env bash
#
# Auto-generated bash script from execution agent trace
# Project: /Users/alisonteske/cs/thesis/execution-agent-test/scalpel-test-build/Scalpel
#
# This script reproduces the actions taken by the execution agent
#

set -e  # Exit on error
set -u  # Exit on undefined variable

# Configuration
DOCKER_TAG='toolscalpel_image:executionagent-1777433572-245a46dc'
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
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/Scalpel/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/Scalpel/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/Scalpel/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install other system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata bash ca-certificates \
    python3 python3-pip python3-venv build-essential graphviz python3-dev \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ARG REPO_URL=https://github.com/SMAT-Lab/Scalpel
ARG PROJECT_DIR=scalpel

RUN git clone --depth 1 "$REPO_URL" "$PROJECT_DIR"

WORKDIR /app/${PROJECT_DIR}

RUN python3 -m venv venv

RUN . venv/bin/activate && \
    pip install --upgrade pip setuptools && \
    pip install -r requirements.txt && \
    pip install -e .

ENV PYTHONPATH=/app/${PROJECT_DIR}

CMD ["/bin/bash"]

EOF_FILE

# ============================================
# Docker image build and container start
# ============================================

# Building Docker image: toolscalpel_image:executionagent-1777433572-245a46dc
echo 'Building Docker image: toolscalpel_image:executionagent-1777433572-245a46dc'
docker build -t 'toolscalpel_image:executionagent-1777433572-245a46dc' '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/Scalpel/Dockerfile_path'
BUILD_STATUS=$?
if [ $BUILD_STATUS -ne 0 ]; then
  echo 'ERROR: Docker build failed with exit code $BUILD_STATUS'
  exit $BUILD_STATUS
fi
DOCKER_TAG='toolscalpel_image:executionagent-1777433572-245a46dc'

# Starting Docker container from image: toolscalpel_image:executionagent-1777433572-245a46dc
echo 'Starting Docker container from image: toolscalpel_image:executionagent-1777433572-245a46dc'
CONTAINER_ID=$(docker run -d -t 'toolscalpel_image:executionagent-1777433572-245a46dc' tail -f /dev/null)
START_STATUS=$?
if [ $START_STATUS -ne 0 ]; then
  echo 'ERROR: Failed to start container'
  exit $START_STATUS
fi
echo 'Container started with ID: $CONTAINER_ID'

# ============================================
# Command execution
# ============================================

# Executing in container: source venv/bin/activate && pip install -r requirements.txt && pip install -e .
echo 'Executing: source venv/bin/activate && pip install -r requirements.txt && pip install -e .'
docker exec $CONTAINER_ID bash -lc 'source venv/bin/activate && pip install -r requirements.txt && pip install -e .'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install setuptools
echo 'Executing: pip install setuptools'
docker exec $CONTAINER_ID bash -lc 'pip install setuptools'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install --upgrade pip setuptools
echo 'Executing: pip install --upgrade pip setuptools'
docker exec $CONTAINER_ID bash -lc 'pip install --upgrade pip setuptools'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: export PYTHONPATH=/app/scalpel
echo 'Executing: export PYTHONPATH=/app/scalpel'
docker exec $CONTAINER_ID bash -lc 'export PYTHONPATH=/app/scalpel'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install -r requirements.txt
echo 'Executing: pip install -r requirements.txt'
docker exec $CONTAINER_ID bash -lc 'pip install -r requirements.txt'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install --upgrade setuptools
echo 'Executing: pip install --upgrade setuptools'
docker exec $CONTAINER_ID bash -lc 'pip install --upgrade setuptools'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: export PYTHONPATH=/app/scalpel
echo 'Executing: export PYTHONPATH=/app/scalpel'
docker exec $CONTAINER_ID bash -lc 'export PYTHONPATH=/app/scalpel'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install setuptools
echo 'Executing: pip install setuptools'
docker exec $CONTAINER_ID bash -lc 'pip install setuptools'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/test_fully_qualified_name_inference.py
echo 'Executing: pytest tests/test_fully_qualified_name_inference.py'
docker exec $CONTAINER_ID bash -lc 'pytest tests/test_fully_qualified_name_inference.py'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install --upgrade setuptools
echo 'Executing: pip install --upgrade setuptools'
docker exec $CONTAINER_ID bash -lc 'pip install --upgrade setuptools'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: export PYTHONPATH=/app/scalpel
echo 'Executing: export PYTHONPATH=/app/scalpel'
docker exec $CONTAINER_ID bash -lc 'export PYTHONPATH=/app/scalpel'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install --upgrade setuptools
echo 'Executing: pip install --upgrade setuptools'
docker exec $CONTAINER_ID bash -lc 'pip install --upgrade setuptools'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install --force-reinstall setuptools
echo 'Executing: pip install --force-reinstall setuptools'
docker exec $CONTAINER_ID bash -lc 'pip install --force-reinstall setuptools'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls /app/scalpel/src/scalpel/
echo 'Executing: ls /app/scalpel/src/scalpel/'
docker exec $CONTAINER_ID bash -lc 'ls /app/scalpel/src/scalpel/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install --upgrade setuptools
echo 'Executing: pip install --upgrade setuptools'
docker exec $CONTAINER_ID bash -lc 'pip install --upgrade setuptools'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install -e .
echo 'Executing: pip install -e .'
docker exec $CONTAINER_ID bash -lc 'pip install -e .'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls src/scalpel
echo 'Executing: ls src/scalpel'
docker exec $CONTAINER_ID bash -lc 'ls src/scalpel'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls src/scalpel/call_graph
echo 'Executing: ls src/scalpel/call_graph'
docker exec $CONTAINER_ID bash -lc 'ls src/scalpel/call_graph'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls src/scalpel/typeinfer
echo 'Executing: ls src/scalpel/typeinfer'
docker exec $CONTAINER_ID bash -lc 'ls src/scalpel/typeinfer'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install setuptools
echo 'Executing: pip install setuptools'
docker exec $CONTAINER_ID bash -lc 'pip install setuptools'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install -e .
echo 'Executing: pip install -e .'
docker exec $CONTAINER_ID bash -lc 'pip install -e .'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install --upgrade setuptools
echo 'Executing: pip install --upgrade setuptools'
docker exec $CONTAINER_ID bash -lc 'pip install --upgrade setuptools'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install -e .
echo 'Executing: pip install -e .'
docker exec $CONTAINER_ID bash -lc 'pip install -e .'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pytest tests/
echo 'Executing: pytest tests/'
docker exec $CONTAINER_ID bash -lc 'pytest tests/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install setuptools
echo 'Executing: pip install setuptools'
docker exec $CONTAINER_ID bash -lc 'pip install setuptools'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install -e .
echo 'Executing: pip install -e .'
docker exec $CONTAINER_ID bash -lc 'pip install -e .'
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