FROM ubuntu:24.04

LABEL os="Ubuntu" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV PATH /usr/local/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

# Install General Packages
RUN apt-get update -y --no-install-recommends && \
    apt-get install -y --no-install-recommends curl wget ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 gnupg xz-utils python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Upgrade Pip
RUN pip3 install --upgrade pip --break-system-packages

# Remove Unused Packages
RUN apt-get autoremove --allow-remove-essential --purge -y