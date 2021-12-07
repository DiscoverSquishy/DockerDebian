FROM quay.io/discoversquishy/dockerimages:ubuntu-base-dev

LABEL name="Ubuntu-Node-16" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

# NodeV12 Installation
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Clear Cache Packages
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Environment Configuration
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]