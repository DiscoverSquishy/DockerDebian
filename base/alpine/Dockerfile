FROM alpine:3.17.0

LABEL os="Alpine" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
RUN adduser -D -h /home/container container && \
    apk --no-cache add \
    "ca-certificates" \
    "curl" \
    "wget" \
    "openssl" \
    "git" \
    "tar" \
    "jq" \
    "tzdata" \
    "sqlite" \
    "fontconfig" \
    "iproute2" \
    "python3" \
    "py3-pip"

# Package cleanup
RUN rm -rf /var/cache/apk/*