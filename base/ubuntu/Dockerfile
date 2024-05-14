FROM ubuntu:24.04

LABEL os="Ubuntu" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV PATH /usr/local/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

# Install General Packages
RUN apt-get update -y --no-install-recommends && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        openssl \
        git \
        tar \
        sqlite3 \
        fontconfig \
        tzdata \
        libfreetype6 \
        iproute2 \
        libstdc++6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Remove Unused Packages
RUN apt-get autoremove --allow-remove-essential --purge -y