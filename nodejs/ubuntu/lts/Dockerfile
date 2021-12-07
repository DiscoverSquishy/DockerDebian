FROM ubuntu:20.04

LABEL name="Ubuntu-Node-LTS" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

# General Packages
RUN apt-get update -y --no-install-recommends \
&& apt-get install -y curl build-essential wget ca-certificates openssl git tar sqlite3 fontconfig iproute2 tar --no-install-recommends \
&& useradd -d /home/container -m container \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

# NodeV12 Installation
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

# Environment Configuration
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]