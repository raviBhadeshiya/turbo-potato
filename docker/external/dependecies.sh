#!/bin/bash

apt-get update && apt-get upgrade -y

apt-get install -y --fix-missing \
    sudo \
    apt-utils \
    git \
    htop \
    wget \
    nano \
    automake \
    bison \
    byacc \
    build-essential \
    cmake \
    doxygen \
    curl \
    gnupg2 \
    lsb-release \
    python3-pip \
    locales \
    python3-numpy \
    python3-pyqt5 \
    libzmq3-dev \
    libdw-dev \
    libgtk2.0-0 \
    unzip \
    libblas-dev \
    liblapack-dev \
    libhdf5-dev \
    libasio-dev \
    libtinyxml2-dev \
    python3-sip-dev \

rm -rf /var/lib/apt/lists/*