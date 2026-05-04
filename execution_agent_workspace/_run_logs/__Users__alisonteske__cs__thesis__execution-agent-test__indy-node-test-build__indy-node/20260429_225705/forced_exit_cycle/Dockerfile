FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
ENV LANG=C.UTF-8

# Install git separately first (CRITICAL RULE)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install other system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    wget \
    gnupg \
    apt-transport-https \
    ca-certificates \
    apt-utils \
    curl \
    jq \
    build-essential \
    gcc \
    make \
    pkg-config \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    python3-nacl \
    libgflags-dev \
    libsnappy-dev \
    zlib1g-dev \
    libbz2-dev \
    liblz4-dev \
    zstd \
    librocksdb-dev \
    libzmq3-dev \
    ruby \
    ruby-dev \
    rubygems \
    libssl-dev \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && rm -rf /var/lib/apt/lists/*

# Add Hyperledger/Indy APT repository (some packages in project CI come from this repo).
# Note: we add the focal "dev" repo as commonly used in upstream Dockerfiles; it's included
# to help satisfy libindy/ursa/other legacy deps if present. This may produce warnings but
# is required for reproducibility with upstream CI.
RUN set -eux; \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 || true; \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 || true; \
    echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" > /etc/apt/sources.list.d/hyperledger-indy.list || true; \
    apt-get update

# Install / upgrade Python build-time packages that are known to be required
RUN pip3 install --no-cache-dir -U pip wheel setuptools==50.3.2 \
    "pyzmq==22.3.0" "Cython==0.29.36" packaging

# Install Ruby gems needed for packaging (fpm requires Ruby >= 3.0; ubuntu:22.04 provides Ruby 3.x)
RUN gem install --no-document fpm rake dotenv -v "2.8.1" || true

# Create working dir
WORKDIR /app

# Allow passing a different repository URL; default to upstream repo
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
# Clone the repository (depth 1 to keep image small)
RUN test -n "$REPO_URL" && git clone --depth 1 "$REPO_URL" indy-node

# Set working directory inside the cloned repository
WORKDIR /app/indy-node

# Default command: open a shell. The helper script (provided separately) should be run inside the container.
CMD ["/bin/bash"]