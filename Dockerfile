FROM adoptopenjdk:11-jdk-hotspot

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apt-get update -y --no-install-recommends \
&& apt-get install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 --no-install-recommends \
&& useradd -d /home/container -m container \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

USER container
ENV USER=container HOME=/home/container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]