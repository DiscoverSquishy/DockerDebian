FROM ubuntu:23.04

LABEL os="Ubuntu" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV PATH /usr/local/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHON_VERSION="3.11.1"

# General Packages Installation
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y curl wget ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 gnupg xz-utils gdb lcov libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev lzma lzma-dev tk-dev uuid-dev zlib1g-dev && \
    apt-get purge python3 -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Python Installation
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
WORKDIR /~/
RUN curl -LJO "https://github.com/python/cpython/archive/refs/tags/v"${PYTHON_VERSION}".tar.gz" && \
    tar -xvzf cpython-"${PYTHON_VERSION}".tar.gz
WORKDIR /~/cpython-"${PYTHON_VERSION}"
RUN ./configure --enable-optimizations && \
    make -s && \
    make altinstall && \
    rm -rf ~/cpython-"${PYTHON_VERSION}"*

# Install Pip
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

# Update Python Packages
RUN pip install pip-review && \
    pip-review --auto

# Remove Unused Packages
RUN apt-get autoremove --allow-remove-essential --purge -y

# Symlink Creation
RUN ln -s /usr/local/bin/python3.11 /usr/local/bin/python && \
    ln -s /usr/local/bin/python3.11 /usr/local/bin/python3