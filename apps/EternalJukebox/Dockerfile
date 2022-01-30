FROM quay.io/discoversquishy/dockerimages:ubuntu-rolling-base

LABEL software="EternalJukebox" os="Ubuntu-Rolling" maintainer="noaimi2214@gmail.com"

RUN apt-get update -y
RUN apt-get install default-jre -y
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl
RUN apt-get install ffmpeg -y
RUN mkdir EternalJukebox && cd EternalJukebox
RUN wget https://jenkins.abimon.org/job/EternalJukebox/lastSuccessfulBuild/artifact/build/libs/EternalJukebox-all.jar
RUN touch config.json
RUN wget https://raw.githubusercontent.com/UnderMybrella/EternalJukebox/master/config_template.yaml
RUN cp config_template.yaml config.yaml && rm config_template.yaml

# Package cleanup
# RUN rm -rf /var/cache/apk/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]