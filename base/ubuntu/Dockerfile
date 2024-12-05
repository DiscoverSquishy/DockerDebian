FROM ubuntu:24.10

LABEL os="Ubuntu" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV PATH="/usr/local/bin:$PATH"
ENV DEBIAN_FRONTEND="noninteractive"

# Install General Packages
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        tar \
        git \
        openssl \
        sqlite3 \
        fontconfig \
        iproute2 \
        xz-utils \
        libgcc-s1 \
        libstdc++6 \
        libc6 \
        zlib1g \
        libssl3 \
        tzdata && \
    apt-get clean && \
    apt-get autoremove --allow-remove-essential --purge -y && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -d /home/container -s /bin/bash container
USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]