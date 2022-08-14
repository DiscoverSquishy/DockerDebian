FROM ubuntu:rolling

LABEL os="Ubuntu-Rolling" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

# General Packages
RUN apt-get update -y --no-install-recommends \
    && useradd -d /home/container -m container

RUN apt-get upgrade libgnutls30 apt libapt-pkg6.0 -y

RUN apt-get clean -y