FROM alpine:3.15

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apk --no-cache add \
    "ca-certificates" \
    "curl" \
    "wget" \
    "openssl" \
    "git" \
    "tar" \
    "sqlite" \
    "fontconfig" \
    "iproute2" \
    "gcc" \
    "make" \
    "cmake" \
    "tar"

RUN wget https://git.musl-libc.org/cgit/musl/snapshot/musl-1.2.2.tar.gz
RUN tar -xvf musl-1.2.2.tar.gz
RUN cd musl-1.2.2
RUN ./musl-1.2.2/configure
RUN make
RUN make install

RUN adduser -D -h /home/container container

# package update & upgrade
RUN apk --no-cache update  \
    apk --no-cache upgrade

# Package cleanup
RUN rm -rf /var/cache/apk/*