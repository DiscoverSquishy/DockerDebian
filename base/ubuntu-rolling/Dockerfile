FROM ubuntu:rolling

LABEL os="Ubuntu-Rolling" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

# General Packages
RUN apt-get update -y --no-install-recommends \
&& apt-get install -y curl wget ca-certificates openssl git tar sqlite3 fontconfig iproute2 tar --no-install-recommends \
&& useradd -d /home/container -m container

RUN apt-get update && apt-get -yq dist-upgrade