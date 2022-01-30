FROM ubuntu:rolling

LABEL os="Ubuntu-20." author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# General Packages
RUN apt-get update -y --no-install-recommends \
    && apt-get install -yq software-properties-common curl wget ca-certificates openssl git tar sqlite3 fontconfig iproute2 tar build-essential --no-install-recommends \
    # && add-apt-repository ppa:deadsnakes/ppa -yq && apt-get update -y --no-install-recommends \
    # && apt-get -yq install python3.10 \
    && useradd -d /home/container -m container \
    # && update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN lsb_release -a
RUN python --version