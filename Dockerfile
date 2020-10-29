FROM alpine:latest

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apk add --no-cache --update ca-certificates \
    && adduser -D -h /home/container container

# package update & upgrade
RUN apk update
RUN apk upgrade

# timezone setting
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/America/New York /etc/localtime
RUN echo "Europe/London" >  /etc/timezone
RUN date

# package cleanup
RUN apk cache clean

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]