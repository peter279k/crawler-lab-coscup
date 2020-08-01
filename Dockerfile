FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y unzip curl apt-transport-https apt-utils curl git-core php7.2-cli php7.2-curl
RUN apt-get install -y php7.2-xml php7.2-dom php7.2-xsl php7.2-json php7.2-mbstring php7.2-zip
RUN apt-get install -y libcurl3-openssl-dev

RUN apt-get clean

WORKDIR /root/

RUN curl -sS https://getcomposer.org/installer | php

RUN php ~/composer.phar require guzzlehttp/guzzle:^6.2
RUN php ~/composer.phar require symfony/dom-crawler:^4.3
RUN php ~/composer.phar require symfony/css-selector:^4.3
