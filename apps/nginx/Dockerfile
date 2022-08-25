FROM quay.io/discoversquishy/dockerimages:alpine-base

LABEL software="Nginx-Alpine" version="Nginx" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

# Environment Configuration
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]