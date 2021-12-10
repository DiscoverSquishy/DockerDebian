FROM quay.io/discoversquishy/dockerimages:ubuntu-base

LABEL name="Ubuntu-NodeJS-17" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

# NodeV12 Installation
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get install -y --no-install-recommends nodejs 2>&1 | \
    grep -v "^debconf: delaying package configuration, since apt-utils.*"

# Clear Cache Packages
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Environment Configuration
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]