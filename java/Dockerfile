FROM adoptopenjdk:8-jdk-hotspot

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apt-get update -y --no-install-recommends \
&& apt-get install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 --no-install-recommends \
&& useradd -d /home/container -m container \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

USER java-container
ENV USER=java-container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]