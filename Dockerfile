# 基于 NVIDIA HPC SDK 的基础镜像
FROM nvcr.io/nvidia/nvhpc:24.7-devel-cuda_multi-ubuntu22.04

# 更新包列表并安装所需的软件包
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    build-essential \
    python-is-python3 \
    python3-distutils \
    python3-dev \
    ncurses-bin \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    openmpi-bin \
    libopenmpi-dev \
    bison \
    pkg-config \
    flex \
    python3-numpy \
    python3-matplotlib \
    python3-progressbar \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置root用户无密码
RUN passwd -d root

# 设置工作目录
WORKDIR /workdir

ENV HOME=/workdir

SHELL ["/bin/bash", "-c"]

# 任何额外的配置或环境变量可以在这里添加

# 结束：此镜像已经配置好所有需要的软件包

