FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git curl wget && rm -rf /var/lib/apt/lists/* \
    && wget --quiet https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh -O /tmp/miniforge.sh \
    && chmod +x /tmp/miniforge.sh \
    && /tmp/miniforge.sh -b -p /opt/conda \
    && rm /tmp/miniforge.sh

ENV PATH="/opt/conda/bin:$PATH"

WORKDIR /app

RUN git clone https://github.com/iris-sast/iris.git .

RUN wget https://raw.githubusercontent.com/iris-sast/iris/main/environment.yml

RUN conda env create -f environment.yml

CMD ["/bin/bash"]