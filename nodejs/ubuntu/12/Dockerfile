FROM quay.io/discoversquishy/dockerimages:ubuntu-base

LABEL software="NodeJS" version="NJS-12" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ARG node_version=12.22.12

WORKDIR /usr/local
RUN curl -o- https://nodejs.org/dist/v${node_version}/node-v${node_version}-linux-x64.tar.xz \
  | tar xJf - --strip 1 && \
  npm install -g npm@latest

RUN node -v

# Clear Cache Packages
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Environment configuration
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]