FROM quay.io/discoversquishy/dockerimages:alpine-base

LABEL software="Alpine-Corretto" version="Java-8" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

ENV CORRETTO_VERSION=8

RUN apk update && apk add --no-cache \
    wget \
    curl \
    ca-certificates \
    && update-ca-certificates

RUN wget -O /etc/apk/keys/amazoncorretto.rsa.pub https://apk.corretto.aws/amazoncorretto.rsa.pub && \
    echo "https://apk.corretto.aws/" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache amazon-corretto-${CORRETTO_VERSION}

# Set the SHELL option -o pipefail
SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# Verify Corretto installation
RUN java -version 2>&1 | grep -q "Corretto" || { echo "Error: Corretto not found in 'java -version' output"; exit 1; }

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]