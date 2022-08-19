FROM alpine:3.16.2

LABEL os="Alpine" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
RUN apk --no-cache add \
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
    "tar"

RUN adduser -D -h /home/container container

# Pip Installation & Symlink Creation
RUN python3 -m ensurepip --upgrade
RUN ln -s /usr/bin/python3.* /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

# Package cleanup
RUN rm -rf /var/cache/apk/*