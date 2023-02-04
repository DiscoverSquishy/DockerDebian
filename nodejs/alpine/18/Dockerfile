FROM quay.io/discoversquishy/dockerimages:alpine-base

LABEL software="NodeJS" version="NJS-18" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ARG node_version=18.14.0

RUN curl -fLO https://unofficial-builds.nodejs.org/download/release/v${node_version}/node-v${node_version}-linux-x64-musl.tar.gz && \
  tar -xzf node-v${node_version}-linux-x64-musl.tar.gz -C /usr --strip-components=1 --no-same-owner && \
  rm node-v${node_version}-linux-x64-musl.tar.gz && \
  npm install -g npm@latest

RUN node -v

# Environment configuration
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]