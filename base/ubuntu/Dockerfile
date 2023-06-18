FROM ubuntu:23.04

LABEL os="Ubuntu" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV PATH /usr/local/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

# General Packages & Python Installation
RUN apt-get update --no-install-recommends -y && \
    apt-get install -y --no-install-recommends curl wget ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 gnupg xz-utils python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Pip
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3

# Upgrade Pip
RUN pip install --no-cache-dir pip-review==1.3.0 && \
    pip-review --auto

# Remove Unused Packages & Symlink Creation
RUN apt-get autoremove --allow-remove-essential --purge -y && \
    ln -s /usr/bin/python3 /usr/bin/python