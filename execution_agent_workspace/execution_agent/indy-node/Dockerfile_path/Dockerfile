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