FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Install git separately first
RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Install other system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata bash ca-certificates \
    curl sudo nano software-properties-common vim wget python3 python3-pip unzip tar apt-transport-https lsb-release \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the project repository
RUN git clone --depth 1 https://github.com/iris-sast/iris.git

WORKDIR /app/iris

# Install Miniforge
RUN wget --quiet https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O /tmp/miniforge.sh \
    && chmod +x /tmp/miniforge.sh \
    && /tmp/miniforge.sh -b -p /opt/conda \
    && rm /tmp/miniforge.sh

# Set PATH for conda
ENV PATH="/opt/conda/bin:$PATH"

# Create the conda environment
COPY environment.yml .
RUN conda env create -f environment.yml

# Switch to the iris environment
RUN echo "conda activate iris" >> ~/.bashrc

# Copy and run the installation and test script
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

CMD ["/bin/bash", "/app/run.sh"]