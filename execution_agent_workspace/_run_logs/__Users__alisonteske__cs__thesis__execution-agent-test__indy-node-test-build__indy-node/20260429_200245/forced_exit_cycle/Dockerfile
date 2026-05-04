FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV LANG=C.UTF-8
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install git separately first (CRITICAL RULE)
RUN apt-get update && apt-get install -y --no-install-recommends git && rm -rf /var/lib/apt/lists/*

# Install core tooling needed to add repos and build packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg \
    wget \
    apt-transport-https \
    ca-certificates \
    curl \
    jq \
    lsb-release \
    software-properties-common \
    build-essential \
    pkg-config \
    python3 \
    python3-pip \
    python3-dev \
    python3-setuptools \
    python3-nacl \
    g++ \
    gcc \
    make \
    libgflags-dev \
    libsnappy-dev \
    zlib1g-dev \
    libbz2-dev \
    liblz4-dev \
    zstd \
    librocksdb-dev \
    ruby \
    ruby-dev \
    rubygems \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && rm -rf /var/lib/apt/lists/*

# Add Hyperledger Indy apt repository keys and source (best-effort; may provide libindy/ursa libs)
# Keys used historically by hyperledger/indy images
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends dirmngr gnupg2 || true; \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 || true; \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 || true; \
    # Add hyperledger indy artifactory (focal repo used historically for some pinned packages)
    echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" > /etc/apt/sources.list.d/hyperledger-indy.list || true; \
    apt-get update || true

# Try to install legacy packages (best-effort). If unavailable, continue; tests will still be attempted.
# Pin exact names where historically used. Use '|| true' so build continues if not available on this base image.
RUN apt-get update && apt-get install -y --no-install-recommends \
    ursa=0.3.2-1 || true && \
    apt-get install -y --no-install-recommends libindy=1.15.0~1625-bionic || true && \
    apt-get install -y --no-install-recommends libssl1.0.0 || true || true; \
    rm -rf /var/lib/apt/lists/*

# Install specific pip build-time dependencies known to be required by project build
RUN pip3 install --no-cache-dir -U \
    setuptools==50.3.2 \
    "pyzmq==22.3.0" \
    "Cython==0.29.36"

# Create working directory
WORKDIR /app

# Default repository URL (can be overridden at build time with --build-arg REPO_URL=...)
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
ARG PROJECT_DIR=indy-node

# Clone the repository (depth 1)
RUN test -n "$REPO_URL" && git clone --depth 1 "$REPO_URL" "$PROJECT_DIR"

# Copy the helper script into the image (will also be provided alongside this Dockerfile)
# The build context must include the script at the same path when building locally; in CI the script will be supplied.
COPY run_in_container.sh /usr/local/bin/run_in_container.sh
RUN chmod +x /usr/local/bin/run_in_container.sh

WORKDIR /app/${PROJECT_DIR}

# Make a safe entrypoint that drops into bash by default. The user can run the included script inside container.
CMD ["/bin/bash"]