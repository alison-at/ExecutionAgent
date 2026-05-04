#!/usr/bin/env bash
#
# Auto-generated bash script from execution agent trace
# Project: /Users/alisonteske/cs/thesis/execution-agent-test/indy-node-test-build/indy-node
#
# This script reproduces the actions taken by the execution agent
#

set -e  # Exit on error
set -u  # Exit on undefined variable

# Configuration
DOCKER_TAG='toolindy-node_image:executionagent-1777521631-8f2036ef'
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
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install essential packages
RUN apt-get update && apt-get install -y git gnupg software-properties-common

# Add Ruby PPA repository for Ruby >= 3.0.0
RUN add-apt-repository ppa:brightbox/ruby-ng --yes

# Add Hyperledger repository keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88

# Add Hyperledger repository for dependencies
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list

# Install system dependencies including Python and required libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates apt-utils curl jq \
    python3 python3-pip python3-nacl rocksdb=5.8.8 \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby3.0 ruby3.0-dev build-essential libssl1.0.0 ursa=0.3.2-1 libindy=1.15.0~1625-bionic

# Install Python build-time requirements
RUN pip3 install -U setuptools==50.3.2 'pyzmq==22.3.0' Cython==0.29.36

# Install the fpm for packaging
RUN gem install --no-document rake dotenv:2.8.1 fpm:1.14.2

# Clean up
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone the project repository
WORKDIR /app
ARG REPO_URL
RUN test -n "$REPO_URL" && git clone --depth 1 "$REPO_URL" indy_node

# Set the working directory to the cloned project
WORKDIR /app/indy_node

# Install project dependencies
RUN pip --cache-dir /root/.cache/pip install .[tests]

# Default command to run on container start
CMD ["/bin/bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install essential packages
RUN apt-get update && apt-get install -y git gnupg software-properties-common

# Introduce Hyperledger repository keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88

# Install dependencies excluding previous failed components
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates apt-utils curl jq \
    python3 python3-pip python3-nacl \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev build-essential python3-dev

# Install Python build-time requirements
RUN pip3 install -U setuptools==50.3.2 'pyzmq==22.3.0' Cython==0.29.36

# Clean up unnecessary files
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone the project repository
WORKDIR /app
ARG REPO_URL
RUN test -n "$REPO_URL" && git clone --depth 1 "$REPO_URL" indy_node

# Set the working directory to the cloned project
WORKDIR /app/indy_node

# Install project dependencies, altered for testing purposes
RUN pip --cache-dir /root/.cache/pip install .[tests]

# Default command to run on container start
CMD ["/bin/bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install essential packages
RUN apt-get update && apt-get install -y git gnupg software-properties-common

# Introduce Hyperledger repository keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88

# Set the repository URL
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node

# Install dependencies excluding previous failed components
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates apt-utils curl jq \
    python3 python3-pip python3-nacl \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev build-essential python3-dev

# Install Python build-time requirements
RUN pip3 install -U setuptools==50.3.2 'pyzmq==22.3.0' Cython==0.29.36

# Clean up unnecessary files
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone the project repository
WORKDIR /app
RUN test -n "$REPO_URL" && git clone --depth 1 "$REPO_URL" indy_node

# Set the working directory to the cloned project
WORKDIR /app/indy_node

# Install project dependencies, altered for testing purposes
RUN pip --cache-dir /root/.cache/pip install .[tests]

# Default command to run on container start
CMD ["/bin/bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install essential packages
RUN apt-get update && apt-get install -y git gnupg software-properties-common

# Introduce Hyperledger repository keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88

# Set the repository URL
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node

# Install dependencies, including rocksdb dev headers
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates apt-utils curl jq \
    python3 python3-pip python3-nacl rocksdb librocksdb-dev \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev build-essential python3-dev

# Install Python build-time requirements
RUN pip3 install -U setuptools==50.3.2 'pyzmq==22.3.0' Cython==0.29.36

# Clean up unnecessary files
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone the project repository
WORKDIR /app
RUN test -n "$REPO_URL" && git clone --depth 1 "$REPO_URL" indy_node

# Set the working directory to the cloned project
WORKDIR /app/indy_node

# Install project dependencies, altered for testing purposes
RUN pip --cache-dir /root/.cache/pip install .[tests]

# Default command to run on container start
CMD ["/bin/bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install essential packages
RUN apt-get update && apt-get install -y git gnupg software-properties-common \
    && add-apt-repository ppa:brightbox/ruby-ng --yes

# Add Hyperledger repository keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88

# Add Hyperledger repository for dependencies
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list

# Install dependencies including rocksdb dev headers
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates apt-utils curl jq \
    python3 python3-pip python3-nacl rocksdb librocksdb-dev \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev build-essential python3-dev

# Install Python build-time requirements
RUN pip3 install -U setuptools==50.3.2 'pyzmq==22.3.0' Cython==0.29.36

# Clean up unnecessary files
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone the project repository
WORKDIR /app
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

# Set the working directory to the cloned project
WORKDIR /app/indy_node

# Install project dependencies, altered for testing purposes
RUN pip --cache-dir /root/.cache/pip install .[tests]

# Default command to run on container start
CMD ["/bin/bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install essential packages
RUN apt-get update && apt-get install -y git gnupg software-properties-common \
    && add-apt-repository ppa:brightbox/ruby-ng --yes

# Add Hyperledger repository keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88

# Add Hyperledger repository for dependencies
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates apt-utils curl jq \
    python3 python3-pip python3-nacl librocksdb-dev \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev build-essential python3-dev

# Install Python build-time requirements
RUN pip3 install -U setuptools==50.3.2 'pyzmq==22.3.0' Cython==0.29.36

# Clean up unnecessary files
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone the project repository
WORKDIR /app
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

# Set the working directory to the cloned project
WORKDIR /app/indy_node

# Install project dependencies
RUN pip --cache-dir /root/.cache/pip install .[tests]

# Default command to run on container start
CMD ["/bin/bash"]
EOF_FILE

# ============================================
# Docker image build and container start
# ============================================

# Building Docker image: toolindy-node_image:executionagent-1777521631-8f2036ef
echo 'Building Docker image: toolindy-node_image:executionagent-1777521631-8f2036ef'
docker build -t 'toolindy-node_image:executionagent-1777521631-8f2036ef' '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'
BUILD_STATUS=$?
if [ $BUILD_STATUS -ne 0 ]; then
  echo 'ERROR: Docker build failed with exit code $BUILD_STATUS'
  exit $BUILD_STATUS
fi
DOCKER_TAG='toolindy-node_image:executionagent-1777521631-8f2036ef'

# Starting Docker container from image: toolindy-node_image:executionagent-1777521631-8f2036ef
echo 'Starting Docker container from image: toolindy-node_image:executionagent-1777521631-8f2036ef'
CONTAINER_ID=$(docker run -d -t 'toolindy-node_image:executionagent-1777521631-8f2036ef' tail -f /dev/null)
START_STATUS=$?
if [ $START_STATUS -ne 0 ]; then
  echo 'ERROR: Failed to start container'
  exit $START_STATUS
fi
echo 'Container started with ID: $CONTAINER_ID'

# ============================================
# Command execution
# ============================================

# Executing in container: apt-cache search rocksdb
echo 'Executing: apt-cache search rocksdb'
docker exec $CONTAINER_ID bash -lc 'apt-cache search rocksdb'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: RUN apt-get update && apt-cache search rocksdb
echo 'Executing: RUN apt-get update && apt-cache search rocksdb'
docker exec $CONTAINER_ID bash -lc 'RUN apt-get update && apt-cache search rocksdb'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip --cache-dir /root/.cache/pip install .[tests]
echo 'Executing: pip --cache-dir /root/.cache/pip install .[tests]'
docker exec $CONTAINER_ID bash -lc 'pip --cache-dir /root/.cache/pip install .[tests]'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: RUSTPYTHONASYNCIODEBUG=0 python3 runner.py --pytest "python3 -m pytest -l -vv" --dir "indy_node" --output "test-result-node.txt"
echo 'Executing: RUSTPYTHONASYNCIODEBUG=0 python3 runner.py --pytest "python3 -m pytest -l -vv" --dir "indy_node" --output "test-result-node.txt"'
docker exec $CONTAINER_ID bash -lc 'RUSTPYTHONASYNCIODEBUG=0 python3 runner.py --pytest "python3 -m pytest -l -vv" --dir "indy_node" --output "test-result-node.txt"'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python3 -m pip install .
echo 'Executing: python3 -m pip install .'
docker exec $CONTAINER_ID bash -lc 'python3 -m pip install .'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: RUSTPYTHONASYNCIODEBUG=0 python3 runner.py --pytest "python3 -m pytest -l -vv" --dir "indy_node" --output "test-result-node.txt"
echo 'Executing: RUSTPYTHONASYNCIODEBUG=0 python3 runner.py --pytest "python3 -m pytest -l -vv" --dir "indy_node" --output "test-result-node.txt"'
docker exec $CONTAINER_ID bash -lc 'RUSTPYTHONASYNCIODEBUG=0 python3 runner.py --pytest "python3 -m pytest -l -vv" --dir "indy_node" --output "test-result-node.txt"'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls indy_node/
echo 'Executing: ls indy_node/'
docker exec $CONTAINER_ID bash -lc 'ls indy_node/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls indy_node/server/
echo 'Executing: ls indy_node/server/'
docker exec $CONTAINER_ID bash -lc 'ls indy_node/server/'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: cat indy_node/server/__init__.py
echo 'Executing: cat indy_node/server/__init__.py'
docker exec $CONTAINER_ID bash -lc 'cat indy_node/server/__init__.py'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: cat indy_node/server/__init__.py
echo 'Executing: cat indy_node/server/__init__.py'
docker exec $CONTAINER_ID bash -lc 'cat indy_node/server/__init__.py'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls indy_node/server
echo 'Executing: ls indy_node/server'
docker exec $CONTAINER_ID bash -lc 'ls indy_node/server'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python3 -m pip install .
echo 'Executing: python3 -m pip install .'
docker exec $CONTAINER_ID bash -lc 'python3 -m pip install .'
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