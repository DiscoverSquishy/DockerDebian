FROM debian:buster-slim

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

## add container user
RUN useradd -m -d /home/container -s /bin/bash container

## update base packages
RUN apt update \
 && apt upgrade -y

## install dependencies
RUN apt install -y gcc g++ libgcc1 lib32gcc1 gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
    libfontconfig libicu63 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev libduktape203 locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates tzdata

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g pm2
RUN npm install -g typescript
RUN npm install -g ts-node

RUN pm2 install typescript

## configure locale
RUN update-locale lang=en_US.UTF-8 \
 && dpkg-reconfigure --fontend noninteractive locales

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]