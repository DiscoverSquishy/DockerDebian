FROM ubuntu:23.04

LABEL os="Ubuntu" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV PATH /usr/local/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

# General Packages Installation
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y curl wget ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 gnupg xz-utils python3

# Install Pip
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3

# Update Python Packages
RUN pip install --no-cache-dir pip-review==1.3.0 && \
    pip-review --auto

# Remove Unused Packages
RUN apt-get autoremove --allow-remove-essential --purge -y

# Symlink Creation
RUN ln -s /usr/bin/python3 /usr/bin/python