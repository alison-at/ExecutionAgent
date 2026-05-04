FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
ARG REPO_URL=https://github.com/hyperledger-indy/indy-node
ARG PROJECT_DIR=indy-node
ENV TZ=Europe/Berlin
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
WORKDIR /app

# 1) Install git separately (CRITICAL RULE)
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates && rm -rf /var/lib/apt/lists/*

# 2) Install base/system packages needed for building and repo/key management
RUN apt-get update && apt-get install -y --no-install-recommends \
        tzdata \
        wget \
        curl \
        gnupg \
        dirmngr \
        apt-transport-https \
        apt-utils \
        jq \
        build-essential \
        gcc \
        make \
        pkg-config \
        python3 \
        python3-pip \
        python3-dev \
        python3-setuptools \
        python3-venv \
        python3-nacl \
        libgflags-dev \
        libsnappy-dev \
        zlib1g-dev \
        libbz2-dev \
        liblz4-dev \
        zstd \
        ruby \
        ruby-dev \
        rubygems \
        lsb-release \
        ca-certificates \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && rm -rf /var/lib/apt/lists/*

# 3) Add Hyperledger/Sovrin apt sources and import known keys.
#    This mirrors the project's CI approach; these repos contain pinned packages like ursa/libindy.
#    Commands tolerate failure (|| true) because networking/repos/keys can be flaky; the build script will attempt fallbacks.
RUN apt-get update \
    && apt-get install -y --no-install-recommends gnupg dirmngr curl || true \
    && (apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 || true) \
    && (apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 || true) \
    && echo "deb https://hyperledger.jfrog.io/artifactory/indy focal dev" > /etc/apt/sources.list.d/hyperledger_indy.list || true \
    && echo "deb https://repo.sovrin.org/deb bionic stable" > /etc/apt/sources.list.d/sovrin.list || true \
    && rm -rf /var/lib/apt/lists/*

# 4) Clone the repository (done in the image so the script can run fast)
RUN test -n "$REPO_URL" && git clone --depth 1 "$REPO_URL" "$PROJECT_DIR"

WORKDIR /app/${PROJECT_DIR}

# 5) Add the runner script into the image and make it executable.
#    The script will perform the more fragile package installation steps at container runtime
#    (apt-get retry logic, .deb fallback, pip installs, building and running tests).
COPY ci_build_and_test.sh /usr/local/bin/ci_build_and_test.sh
RUN chmod +x /usr/local/bin/ci_build_and_test.sh

# 6) Useful defaults; the script can also be executed interactively.
CMD ["/usr/local/bin/ci_build_and_test.sh"]