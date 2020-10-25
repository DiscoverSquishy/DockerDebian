FROM        alpine:latest

LABEL       author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN         apk add --no-cache --update ca-certificates \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]