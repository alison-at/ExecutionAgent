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
DOCKER_TAG='toolindy-node_image:executionagent-1777515346-72b1b6a9'
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

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install additional repository signing keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88

# Add required apt sources to install dependencies
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list
RUN echo "deb https://repo.sovrin.org/deb bionic master" >> /etc/apt/sources.list
RUN echo "deb https://repo.sovrin.org/sdk/deb bionic master" >> /etc/apt/sources.list

# Update apt and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make \
    libssl1.0.0 ursa=0.3.2-1 libindy=1.15.0~1625-bionic

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies
RUN pip --cache-dir /root/.cache/pip install .[tests]

CMD ["bash"]

EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install gnupg before adding keys
RUN apt-get update && apt-get install -y gnupg

# Install additional repository signing keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88

# Add required apt sources to install dependencies
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list
RUN echo "deb https://repo.sovrin.org/deb bionic master" >> /etc/apt/sources.list
RUN echo "deb https://repo.sovrin.org/sdk/deb bionic master" >> /etc/apt/sources.list

# Update apt and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make \
    libssl1.0.0 ursa=0.3.2-1 libindy=1.15.0~1625-bionic

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies
RUN pip --cache-dir /root/.cache/pip install .[tests]

CMD ["bash"]

EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install gnupg before adding keys
RUN apt-get update && apt-get install -y gnupg

# Install additional repository signing keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88

# Add required apt sources to install dependencies
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list
# RUN echo "deb https://repo.sovrin.org/deb bionic master" >> /etc/apt/sources.list
# RUN echo "deb https://repo.sovrin.org/sdk/deb bionic master" >> /etc/apt/sources.list

# Update apt and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make \
    libssl1.0.0 ursa=0.3.2-1 libindy=1.15.0~1625-bionic

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies
RUN pip --cache-dir /root/.cache/pip install .[tests]

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install gnupg before adding keys
RUN apt-get update && apt-get install -y gnupg

# Install additional repository signing keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88

# Add required apt sources to install dependencies
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list

# Update apt and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make \
    libssl1.0.0 ursa=0.3.2-1 libindy=1.15.0~1625-bionic

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies
RUN pip --cache-dir /root/.cache/pip install .[tests]

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install gnupg before adding keys
RUN apt-get update && apt-get install -y gnupg

# Install additional repository signing keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88

# Add required apt sources to install dependencies
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list
# Removed the outdated bionic-security repository

# Update apt and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make \
    libssl1.0.0 ursa=0.3.2-1 libindy=1.15.0~1625-bionic

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies
RUN pip --cache-dir /root/.cache/pip install .[tests]

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install gnupg before adding keys
RUN apt-get update && apt-get install -y gnupg

# Add required apt sources to install dependencies
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list

# Update apt and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies
RUN pip --cache-dir /root/.cache/pip install .[tests]

CMD ["bash"]

EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install gnupg before adding keys
RUN apt-get update && apt-get install -y gnupg

# Add the missing GPG key for the Hyperledger repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61

# Add Hyperledger apt source
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list

# Update apt and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies
RUN pip --cache-dir /root/.cache/pip install .[tests]

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install gnupg before adding keys
RUN apt-get update && apt-get install -y gnupg

# Add the missing GPG key for the Hyperledger repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61

# Add Hyperledger apt source
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list

# Update apt and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Commenting out python-rocksdb due to installation issues
# RUN pip --cache-dir /root/.cache/pip install python-rocksdb

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies, excluding python-rocksdb for this build
RUN pip --cache-dir /root/.cache/pip install .[tests]

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install gnupg before adding keys
RUN apt-get update && apt-get install -y gnupg

# Add the missing GPG key for the Hyperledger repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61

# Add Hyperledger apt source
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list

# Update apt and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies, excluding python-rocksdb for this build
RUN pip --cache-dir /root/.cache/pip install .[tests]

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install gnupg before adding keys
RUN apt-get update && apt-get install -y gnupg

# Add the missing GPG key for the Hyperledger repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61

# Add Hyperledger apt source
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list

# Update apt and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies, excluding python-rocksdb for this build
# RUN pip --cache-dir /root/.cache/pip install python-rocksdb
RUN pip --cache-dir /root/.cache/pip install .[tests]

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install gnupg before adding keys
RUN apt-get update && apt-get install -y gnupg

# Add the missing GPG key for the Hyperledger repository
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61

# Add Hyperledger apt source
RUN echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" >> /etc/apt/sources.list

# Update apt and install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies, excluding python-rocksdb for this build
RUN pip --cache-dir /root/.cache/pip install .[tests]

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install required dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Set working directory
WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

# Change to project directory
WORKDIR /app/indy_node

# Install Python dependencies
RUN pip install .[tests]

# Clean up apt cache
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install required dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Set working directory
WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies (excluding python-rocksdb)
RUN pip --cache-dir /root/.cache/pip install .[tests]

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install required dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Set working directory
WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies, excluding python-rocksdb to avoid build failures
RUN pip --cache-dir /root/.cache/pip install .[tests]

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install required dependencies excluding python-rocksdb
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Set working directory
WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies without python-rocksdb
RUN pip --cache-dir /root/.cache/pip install .[tests]

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install minimal required dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Set working directory
WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies excluding python-rocksdb and additional problematic libraries
RUN pip --cache-dir /root/.cache/pip install .[tests]

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
EOF_FILE

# Creating Dockerfile directory
mkdir -p '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'

# Writing file: /Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile (local)
cat > '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path/Dockerfile' <<'EOF_FILE'
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install required dependencies excluding python-rocksdb
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget apt-transport-https ca-certificates curl jq \
    python3 python3-pip python3-nacl python3-dev g++ \
    libgflags-dev zlib1g-dev libbz2-dev liblz4-dev \
    zstd ruby ruby-dev rubygems gcc make

# Set working directory
WORKDIR /app

# Clone the repository
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
RUN git clone --depth 1 "$REPO_URL" indy_node

WORKDIR /app/indy_node

# Install Python dependencies without python-rocksdb
RUN pip --cache-dir /root/.cache/pip install .[tests] --no-deps

# Clean up apt caches
RUN apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
EOF_FILE

# ============================================
# Docker image build and container start
# ============================================

# Building Docker image: toolindy-node_image:executionagent-1777515346-72b1b6a9
echo 'Building Docker image: toolindy-node_image:executionagent-1777515346-72b1b6a9'
docker build -t 'toolindy-node_image:executionagent-1777515346-72b1b6a9' '/Users/alisonteske/cs/thesis/execution-agent-test/ExecutionAgent/execution_agent_workspace/execution_agent/indy-node/Dockerfile_path'
BUILD_STATUS=$?
if [ $BUILD_STATUS -ne 0 ]; then
  echo 'ERROR: Docker build failed with exit code $BUILD_STATUS'
  exit $BUILD_STATUS
fi
DOCKER_TAG='toolindy-node_image:executionagent-1777515346-72b1b6a9'

# Starting Docker container from image: toolindy-node_image:executionagent-1777515346-72b1b6a9
echo 'Starting Docker container from image: toolindy-node_image:executionagent-1777515346-72b1b6a9'
CONTAINER_ID=$(docker run -d -t 'toolindy-node_image:executionagent-1777515346-72b1b6a9' tail -f /dev/null)
START_STATUS=$?
if [ $START_STATUS -ne 0 ]; then
  echo 'ERROR: Failed to start container'
  exit $START_STATUS
fi
echo 'Container started with ID: $CONTAINER_ID'

# ============================================
# Command execution
# ============================================

# Executing in container: docker build -t indy-node:latest .
echo 'Executing: docker build -t indy-node:latest .'
docker exec $CONTAINER_ID bash -lc 'docker build -t indy-node:latest .'
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