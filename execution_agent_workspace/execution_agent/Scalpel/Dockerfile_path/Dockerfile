FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git

# Install other system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata bash ca-certificates \
    python3 python3-pip python3-venv build-essential graphviz \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ARG REPO_URL=https://github.com/SMAT-Lab/Scalpel
ARG PROJECT_DIR=Scalpel

RUN test -n "$REPO_URL" && git clone --depth 1 "$REPO_URL" "$PROJECT_DIR"

WORKDIR /app/${PROJECT_DIR}

CMD ["/bin/bash"]