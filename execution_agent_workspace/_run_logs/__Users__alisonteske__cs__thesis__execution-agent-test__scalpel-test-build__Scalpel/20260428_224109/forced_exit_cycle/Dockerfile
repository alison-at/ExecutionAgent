FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV PYTHONUNBUFFERED=1

# Install git separately first (critical)
RUN apt-get update && apt-get install -y git

# Install other required system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    ca-certificates \
    bash \
    python3 \
    python3-pip \
    python3-venv \
    build-essential \
    graphviz \
    python3-dev \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Repository to clone. Can be overridden at build time with --build-arg REPO_URL=...
ARG REPO_URL=https://github.com/SMAT-Lab/Scalpel
ARG PROJECT_DIR=project

# Clone repository into PROJECT_DIR
RUN test -n "$REPO_URL" && git clone --depth 1 "$REPO_URL" "$PROJECT_DIR"

WORKDIR /app/${PROJECT_DIR}

# Copy the test script into the image (the build context must include this file)
# The build tooling that uses these two files should provide the script alongside the Dockerfile.
COPY run_tests.sh /app/${PROJECT_DIR}/run_tests.sh
RUN chmod +x /app/${PROJECT_DIR}/run_tests.sh

# Set PYTHONPATH so tests can import the package during runs
ENV PYTHONPATH=/app/${PROJECT_DIR}:${PYTHONPATH:-}

# Default command drops you into a shell inside the prepared project directory.
CMD ["/bin/bash"]