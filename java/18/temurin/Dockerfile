FROM quay.io/discoversquishy/dockerimages:ubuntu-base

LABEL software="Java-Temurin" version="Java-18" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

ENV JAVA_VERSION="18"

WORKDIR /opt/java/openjdk
RUN curl -L -o "temurin-download.sh" "https://nocache.discoversquishy.me/scripts/temurin-download.sh" && \
    bash temurin-download.sh "${JAVA_VERSION}" && \
    rm temurin-download.sh

RUN tar -xf /tmp/openjdk.tar.gz --strip-components=1; \
    rm -rf /tmp/openjdk.tar.gz;

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"

RUN java -version

# Environment Configuration
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]