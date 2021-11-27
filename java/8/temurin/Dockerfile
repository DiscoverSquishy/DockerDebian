FROM alpine:3.14

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

# Package Update & Upgrade
RUN apk update --no-cache
RUN apk upgrade --no-cache

# General Packages
RUN apk add --no-cache \
    ca-certificates \
    curl \
    openssl \
    git \
    tar \
    sqlite \
    fontconfig \
    tzdata \
    && adduser -D -h /home/container container

# Set Timezone
RUN apk add --no-cache tzdata openssl && cp /usr/share/zoneinfo/America/New_York /etc/localtime
RUN echo "America/New_York" > /etc/timezone && date

# Install Java 8 Temurin
RUN wget https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.1%2B12/OpenJDK17U-jdk_x64_alpine-linux_hotspot_17.0.1_12.tar.gz
RUN export PATH=$PWD/jdk-17.0.1+12/bin:$PATH

# Package Cache Cleanup
RUN rm -rf /var/cache/apk/*

# Enviroment Configuration
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Entrypoint Script
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]