FROM alpine:3.12.1

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apk add --update ca-certificates \
    && adduser -D -h /home/container container

# package update & upgrade
RUN apk update
RUN apk upgrade

# timezone setting
# RUN apk add tzdata
# RUN cp /usr/share/zoneinfo/America/New_York /etc/localtime
# RUN echo "America/New_York" >  /etc/timezone
# RUN date

RUN apk add --no-cache tzdata \
    cp /usr/share/zoneinfo/America/New_York /etc/localtime \
    echo "America/New_York" >  /etc/timezone \
    date

# package cleanup
RUN rm -rf /var/cache/apk/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]