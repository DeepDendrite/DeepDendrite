# 基于 NVIDIA HPC SDK 的基础镜像
ARG HPCSDK_VER="21.9"
ARG CUDA_VER="_multi"
ARG UBUNTU_VER="20.04"
FROM nvcr.io/nvidia/nvhpc:${HPCSDK_VER}-devel-cuda${CUDA_VER}-ubuntu${UBUNTU_VER}

ENV CUDA_BIN_PATH="/opt/nvidia/hpc_sdk/Linux_x86_64/${HPCSDK_VERSION}/cuda"

# 更新包列表并安装所需的软件包
RUN DEBIAN_FRONTEND=noninteractive  apt-get update && apt-get upgrade -y && apt-get install -y  \
    build-essential \
    python-is-python3 \
    python3-distutils \
    python3-dev \
    ncurses-bin \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    bison \
    pkg-config \
    flex \
    python3-numpy \
    python3-matplotlib \
    python3-progressbar \
    mpich \
    libmpich-dev \
    lmod \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置root用户无密码
RUN passwd -d root

# 设置工作目录
WORKDIR /workdir

#禁止检测CUDA
ENV CUDA_VISIBLE_DEVICES=99
ENV HOME=/workdir

SHELL ["/bin/bash", "-c"]

# 任何额外的配置或环境变量可以在这里添加

# 结束：此镜像已经配置好所有需要的软件包

