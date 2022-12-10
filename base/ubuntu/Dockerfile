FROM ubuntu:23.04

LABEL os="Ubuntu" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV PATH /usr/local/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

# General Packages
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y curl wget ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 gnupg software-properties-common xz-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -d /home/container -m container

# # Remove Useless Packages
RUN apt-get purge software-properties-common -y && \
    apt-get autoremove --allow-remove-essential --purge -y