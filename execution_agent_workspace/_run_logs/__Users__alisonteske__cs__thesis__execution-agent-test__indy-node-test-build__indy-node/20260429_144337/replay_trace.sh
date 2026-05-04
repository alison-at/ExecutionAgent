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
DOCKER_TAG='toolindy-node_image:executionagent-1777500454-66649375'
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

# Install essential dependencies including gnupg for repository management
RUN apt-get update && apt-get install -y gnupg git wget apt-transport-https ca-certificates apt-utils curl jq

# Add necessary repositories
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 \
 && echo 'deb https://hyperledger.jfrog.io/artifactory/indy focal dev' >> /etc/apt/sources.list

# Update and install essential dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-nacl libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev zstd ruby ruby-dev rubygems gcc make libssl1.0.0 ursa=0.3.2-1 libindy=1.15.0~1625-bionic

# Clean apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone project
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
ARG PROJECT_DIR=indy-node
RUN git clone --depth 1 "$REPO_URL" "$PROJECT_DIR"

WORKDIR /app/${PROJECT_DIR}
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install essential dependencies including gnupg for repository management
RUN apt-get update && apt-get install -y gnupg git wget apt-transport-https ca-certificates apt-utils curl jq

# Add necessary repositories
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 \
 && echo 'deb https://hyperledger.jfrog.io/artifactory/indy focal dev' >> /etc/apt/sources.list

# Update and install essential dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-nacl libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev zstd ruby ruby-dev rubygems gcc make libssl1.1 ursa libindy

# Clean apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone project
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
ARG PROJECT_DIR=indy-node
RUN git clone --depth 1 "$REPO_URL" "$PROJECT_DIR"

WORKDIR /app/${PROJECT_DIR}
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install essential dependencies
RUN apt-get update && apt-get install -y gnupg git wget apt-transport-https ca-certificates apt-utils curl jq

# Add Hyperledger repository and keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 \
    && echo 'deb https://hyperledger.jfrog.io/artifactory/indy focal dev' >> /etc/apt/sources.list

# Update repositories and install packages
RUN apt-get update && apt-get install -y python3 python3-pip python3-nacl libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev zstd ruby ruby-dev rubygems gcc make libssl1.0.0 ursa=0.3.2-1 libindy=1.15.0~1625-bionic

# Clean apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone project repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
ARG PROJECT_DIR=indy-node
RUN git clone --depth 1 "$REPO_URL" "$PROJECT_DIR"

WORKDIR /app/${PROJECT_DIR}
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install essential dependencies
RUN apt-get update && apt-get install -y gnupg git wget apt-transport-https ca-certificates apt-utils curl jq

# Add necessary repositories
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 \
 && echo 'deb https://hyperledger.jfrog.io/artifactory/indy focal dev' >> /etc/apt/sources.list

# Update and install essential dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-nacl libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev zstd ruby ruby-dev rubygems gcc make libssl1.1 ursa=0.3.2-2 libindy=1.16.0-2

# Clean apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone project
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
ARG PROJECT_DIR=indy-node
RUN git clone --depth 1 "$REPO_URL" "$PROJECT_DIR"

WORKDIR /app/${PROJECT_DIR}
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install essential dependencies
RUN apt-get update && apt-get install -y gnupg git wget apt-transport-https ca-certificates apt-utils curl jq

# Add necessary repositories
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 \
 && echo 'deb https://hyperledger.jfrog.io/artifactory/indy focal dev' >> /etc/apt/sources.list

# Update and install essential dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-nacl libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev zstd ruby ruby-dev rubygems gcc make libssl1.1 ursa libindy

# Clean apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone project
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
ARG PROJECT_DIR=indy-node
RUN git clone --depth 1 "$REPO_URL" "$PROJECT_DIR"

WORKDIR /app/${PROJECT_DIR}
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install essential dependencies
RUN apt-get update && apt-get install -y gnupg git wget apt-transport-https ca-certificates apt-utils curl jq

# Add necessary repositories
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 \
 && echo 'deb https://hyperledger.jfrog.io/artifactory/indy focal dev' >> /etc/apt/sources.list

# Update and install essential dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-nacl libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev zstd ruby ruby-dev rubygems gcc make libssl1.1

# Clean apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# Clone project
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
ARG PROJECT_DIR=indy-node
RUN git clone --depth 1 "$REPO_URL" "$PROJECT_DIR"

WORKDIR /app/${PROJECT_DIR}
EOF_FILE

# ============================================
# Docker image build and container start
# ============================================

# Building Docker image: toolindy-node_image:executionagent-1777500454-66649375
echo 'Building Docker image: toolindy-node_image:executionagent-1777500454-66649375'
docker build -t 'toolindy-node_image:executionagent-1777500454-66649375' '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'
BUILD_STATUS=$?
if [ $BUILD_STATUS -ne 0 ]; then
  echo 'ERROR: Docker build failed with exit code $BUILD_STATUS'
  exit $BUILD_STATUS
fi
DOCKER_TAG='toolindy-node_image:executionagent-1777500454-66649375'

# Starting Docker container from image: toolindy-node_image:executionagent-1777500454-66649375
echo 'Starting Docker container from image: toolindy-node_image:executionagent-1777500454-66649375'
CONTAINER_ID=$(docker run -d -t 'toolindy-node_image:executionagent-1777500454-66649375' tail -f /dev/null)
START_STATUS=$?
if [ $START_STATUS -ne 0 ]; then
  echo 'ERROR: Failed to start container'
  exit $START_STATUS
fi
echo 'Container started with ID: $CONTAINER_ID'

# ============================================
# Command execution
# ============================================

# Executing in container: apt-cache policy ursa
echo 'Executing: apt-cache policy ursa'
docker exec $CONTAINER_ID bash -lc 'apt-cache policy ursa'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install -U setuptools==50.3.2 pyzmq==22.3.0 Cython==0.29.36 && pip install .[tests]
echo 'Executing: pip install -U setuptools==50.3.2 pyzmq==22.3.0 Cython==0.29.36 && pip install .[tests]'
docker exec $CONTAINER_ID bash -lc 'pip install -U setuptools==50.3.2 pyzmq==22.3.0 Cython==0.29.36 && pip install .[tests]'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: find . -type f
echo 'Executing: find . -type f'
docker exec $CONTAINER_ID bash -lc 'find . -type f'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: ls
echo 'Executing: ls'
docker exec $CONTAINER_ID bash -lc ls
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

# Executing in container: git clone --depth 1 https://github.com/hyperledger-indy/indy-node.git .
echo 'Executing: git clone --depth 1 https://github.com/hyperledger-indy/indy-node.git .'
docker exec $CONTAINER_ID bash -lc 'git clone --depth 1 https://github.com/hyperledger-indy/indy-node.git .'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python3 -m pip install .[tests]
echo 'Executing: python3 -m pip install .[tests]'
docker exec $CONTAINER_ID bash -lc 'python3 -m pip install .[tests]'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: apt-get update && apt-get install -y rocksdb
echo 'Executing: apt-get update && apt-get install -y rocksdb'
docker exec $CONTAINER_ID bash -lc 'apt-get update && apt-get install -y rocksdb'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: apt-cache search rocksdb
echo 'Executing: apt-cache search rocksdb'
docker exec $CONTAINER_ID bash -lc 'apt-cache search rocksdb'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: apt-get install -y librocksdb-dev librocksdb5.17
echo 'Executing: apt-get install -y librocksdb-dev librocksdb5.17'
docker exec $CONTAINER_ID bash -lc 'apt-get install -y librocksdb-dev librocksdb5.17'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install python-rocksdb
echo 'Executing: pip install python-rocksdb'
docker exec $CONTAINER_ID bash -lc 'pip install python-rocksdb'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: pip install .[tests]
echo 'Executing: pip install .[tests]'
docker exec $CONTAINER_ID bash -lc 'pip install .[tests]'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: python3 -m pytest -l -vv
echo 'Executing: python3 -m pytest -l -vv'
docker exec $CONTAINER_ID bash -lc 'python3 -m pytest -l -vv'
CMD_STATUS=$?
if [ $CMD_STATUS -ne 0 ]; then
  echo 'WARNING: Command failed with exit code $CMD_STATUS'
  # Continuing despite error (agent may have handled this)
fi

# Executing in container: find /usr/lib -name libursa.so
echo 'Executing: find /usr/lib -name libursa.so'
docker exec $CONTAINER_ID bash -lc 'find /usr/lib -name libursa.so'
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