FROM ubuntu:20.04

LABEL os="Ubuntu-20.04" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV PATH /usr/local/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

# General Packages
RUN apt-get update -y --no-install-recommends && \
	useradd -d /home/container -m container

RUN apt-get install curl software-properties-common -y && \
	add-apt-repository ppa:deadsnakes/ppa -y && \
	apt-get install -y python3.11 --no-install-recommends && \
	apt-get upgrade libgnutls30 -y && \
	curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

RUN add-apt-repository --remove ppa:deadsnakes/ppa -y && \
	apt-get purge software-properties-common -y && \
	apt-get autoremove --allow-remove-essential --purge -y

RUN ln -s /usr/bin/python3.11 /usr/bin/python && \
	ln -s /usr/bin/python3.11 /usr/bin/python3 && \
    ln -s /usr/bin/pip3 /usr/bin/pip

RUN apt-get clean -y