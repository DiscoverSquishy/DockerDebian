FROM ubuntu:22.10

LABEL os="Ubuntu" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV PATH /usr/local/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

# General Packages
RUN apt-get update -y && \
	apt-get install --no-install-recommends -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 gnupg software-properties-common xz-utils && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	useradd -d /home/container -m container

# Python Installation
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN add-apt-repository ppa:deadsnakes/ppa -y && \
	apt-get install -y python3.11 --no-install-recommends && \
	curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

# Remove Useless Packages
RUN add-apt-repository --remove ppa:deadsnakes/ppa -y && \
	apt-get purge software-properties-common -y && \
	apt-get autoremove --allow-remove-essential --purge -y

# Symlink Creation
RUN ln -s /usr/bin/python3.11 /usr/bin/python && \
	ln -s /usr/bin/python3.11 /usr/bin/python3 && \
    ln -s /usr/bin/pip3 /usr/bin/pip