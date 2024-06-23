FROM quay.io/discoversquishy/dockerimages:alpine-base

LABEL software="Alpine-Temurin" version="Java-18" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

ENV JAVA_VERSION="18"

WORKDIR /opt/java/openjdk

# Download the Eclipse Adoptium RSA key
RUN wget -O /etc/apk/keys/adoptium.rsa.pub https://packages.adoptium.net/artifactory/api/security/keypair/public/repositories/apk

# Configure the Eclipse Adoptium APK repository
RUN echo 'https://packages.adoptium.net/artifactory/apk/alpine/main' >> /etc/apk/repositories

# Install the Temurin JDK using the environment variable
RUN apk update && apk add temurin-${JAVA_VERSION}-jdk

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"

# Verify the Temurin installation
RUN java -version 2>&1 | grep -q "Temurin" || { echo "Error: Temurin not found in 'java -version' output"; exit 1; }

# Environment Configuration
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/sh", "/entrypoint.sh"]