FROM alpine:3.14.0

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apk add --no-cache \
    ca-certificates \
    && apk del musl \
    && adduser -D -h /home/container container

# package update & upgrade
RUN apk update --no-cache
RUN apk upgrade --no-cache

# Optimized manner of provocating a layer
RUN apk add --no-cache tzdata openssl && cp /usr/share/zoneinfo/America/New_York /etc/localtime
RUN echo "America/New_York" > /etc/timezone && date

# package cleanup
RUN rm -rf /var/cache/apk/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]