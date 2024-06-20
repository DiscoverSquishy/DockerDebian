FROM quay.io/discoversquishy/dockerimages:ubuntu-base

LABEL software="Java-Corretto" version="Java-19" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

ENV CORRETTO_VERSION=19

RUN apt-get update && apt-get install --no-install-recommends -y java-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    ARCH=$(uname -m); \
    case "${ARCH}" in \
        x86_64) \
            URL="https://corretto.aws/downloads/latest/amazon-corretto-$CORRETTO_VERSION-x64-linux-jdk.deb"; \
            ;; \
        aarch64) \
            URL="https://corretto.aws/downloads/latest/amazon-corretto-$CORRETTO_VERSION-aarch64-linux-jdk.deb"; \
            ;; \
        *) \
            echo "Unsupported architecture: ${ARCH}"; \
            exit 1; \
            ;; \
    esac; \
    curl -LO "${URL}"; \
    dpkg --install "$(basename "${URL}")"; \
    rm "$(basename "${URL}")"

# Set the SHELL option -o pipefail
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN java -version 2>&1 | grep -q "Corretto" || { echo "Error: Corretto not found in 'java -version' output"; exit 1; }

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]