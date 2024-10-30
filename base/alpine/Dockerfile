FROM alpine:3.20.3

LABEL os="Alpine" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
RUN apk --no-cache add \
        ca-certificates \
        curl \
        git \
        jq \
        wget \
        tzdata \
        gettext \
        openssl

RUN addgroup -g 1000 container && \
    adduser -D -h /home/container -u 1000 -G container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/ash", "/entrypoint.sh"]