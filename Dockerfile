FROM alpine:3.15

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apk add ca-certificates --no-cache \
    && adduser -D -h /home/container container \
    && apk --no-cache upgrade musl

# package update & upgrade
RUN apk update --no-cache \
    apk upgrade --no-cache

# Setting Timezone
RUN apk add --no-cache tzdata openssl && cp /usr/share/zoneinfo/America/New_York /etc/localtime
RUN echo "America/New_York" > /etc/timezone && date

# Package cleanup
RUN rm -rf /var/cache/apk/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]