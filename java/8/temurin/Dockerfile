FROM quay.io/discoversquishy/dockerimages:ubuntu-base

LABEL software="Java-Temurin" version="Java-8" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

ENV JAVA_VERSION="8"

RUN curl -LfsSo $HOME/temurin-download.sh https://i.discoversquishy.me/scripts/temurin-download.sh && \
    bash $HOME/temurin-download.sh ${JAVA_VERSION} && \
    rm $HOME/temurin-download.sh

RUN mkdir -p /opt/java/openjdk; \
    cd /opt/java/openjdk; \
    tar -xf /tmp/openjdk.tar.gz --strip-components=1; \
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