FROM quay.io/discoversquishy/dockerimages:ubuntu-rolling-base

LABEL software="Java-Corretto" version="Java-11" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apt-get update && apt-get install java-common
RUN curl -LO https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.deb && \
    dpkg --install amazon-corretto-11-x64-linux-jdk.deb && \
    rm amazon-corretto-11-x64-linux-jdk.deb

# Package cleanup
RUN rm -rf /var/cache/apk/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]