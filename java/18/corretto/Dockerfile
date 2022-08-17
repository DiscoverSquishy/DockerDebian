FROM quay.io/discoversquishy/dockerimages:ubuntu-base

LABEL software="Java-Corretto" version="Java-18" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apt-get update && apt-get install java-common
RUN curl -LO https://corretto.aws/downloads/latest/amazon-corretto-18-x64-linux-jdk.deb && \
    dpkg --install amazon-corretto-18-x64-linux-jdk.deb && \
    rm amazon-corretto-18-x64-linux-jdk.deb

# Package cleanup
RUN apt-get clean -y && rm -rf /var/cache/apk/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]