FROM quay.io/discoversquishy/dockerimages:ubuntu-rolling-base

LABEL software="EternalJukebox" os="Ubuntu-Rolling" maintainer="noaimi2214@gmail.com"

RUN apt-get update -y
RUN apt-get install default-jre -y
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl
RUN apt-get install ffmpeg -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]