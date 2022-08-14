FROM ubuntu:20.04

LABEL os="Ubuntu-20.04" author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"
ENV PATH /usr/local/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

# General Packages
RUN apt-get update -y --no-install-recommends

RUN apt-get install -y --no-install-recommends ca-certificates curl wget netbase tzdata dpkg-dev gcc gnupg dirmngr libbluetooth-dev libbz2-dev libc6-dev libexpat1-dev libffi-dev \libgdbm-dev liblzma-dev libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev make tk-dev uuid-dev wget xz-utils zlib1g-dev

RUN wget -O python-install.sh --no-cache --no-cookies https://i.discoversquishy.me/media/python-cacheee.sh --ca-certificate=https://developers.cloudflare.com/ssl/static/origin_ca_rsa_root.pem;

RUN bash python-install.sh;

RUN apt-get update -y --no-install-recommends && apt-get install -y wget
RUN wget -O get-pip.py https://bootstrap.pypa.io/get-pip.py; \
	\
	export PYTHONDONTWRITEBYTECODE=1; \
	\
	python get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir \
		--no-compile \
		"pip==22.2.2" \
		"setuptools==63.2.0" \
	; \
	rm -f get-pip.py; \
	\
	pip --version

RUN apt-get update -y --no-install-recommends \
    && curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash