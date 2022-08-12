FROM quay.io/discoversquishy/dockerimages:alpine-base

LABEL software="Java-Corretto" version="Java-18" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN  wget -O /etc/apk/keys/amazoncorretto.rsa.pub  https://apk.corretto.aws/amazoncorretto.rsa.pub \
    && echo "https://apk.corretto.aws/" >> /etc/apk/repositories \
    && apk update

RUN apk add amazon-corretto-18

# Package cleanup
RUN rm -rf /var/cache/apk/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]