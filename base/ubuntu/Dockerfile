FROM ubuntu:23.04

LABEL os="Ubuntu" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV PATH /usr/local/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

# General Packages
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y curl wget ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 gnupg software-properties-common xz-utils gdb lcov libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev lzma lzma-dev tk-dev uuid-dev zlib1g-dev && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -d /home/container -m container

# # Python Installation
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN cd ~ && \
    wget https://github.com/python/cpython/archive/refs/tags/v3.11.1.tar.gz && \
    tar xzf v3.11.1.tar.gz && \
    cd cpython-3.11.1 && \
    ./configure --enable-optimizations && \
    make -s && \
    make altinstall

RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

# # Remove Useless Packages
RUN apt-get purge software-properties-common -y && \
    apt-get autoremove --allow-remove-essential --purge -y

# # Symlink Creation
RUN ln -s /usr/bin/python3.11 /usr/bin/python && \
    ln -s /usr/bin/python3.11 /usr/bin/python3 && \
    ln -s /usr/bin/pip3 /usr/bin/pip
