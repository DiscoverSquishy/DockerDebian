FROM eclipse-temurin:8

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

# General Packages
RUN apt-get update -y --no-install-recommends \
&& apt-get dist-upgrade -y --no-install-recommends \
&& apt-get install -y curl wget ca-certificates openssl git tar sqlite3 fontconfig iproute2 tar --no-install-recommends \
&& useradd -d /home/container -m container \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Java 8 Temurin
RUN cd
RUN wget https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u312-b07/OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz
RUN tar xzf OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz
RUN export PATH=$PWD/jdk8u312-b07/bin:$PATH
RUN java -version


# Enviroment Configuration
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]