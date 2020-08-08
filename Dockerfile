FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y unzip curl apt-transport-https apt-utils curl git-core php7.2-cli php7.2-curl libtesseract4 tesseract-ocr
RUN apt-get install -y php7.2-xml php7.2-dom php7.2-xsl php7.2-json php7.2-mbstring php7.2-zip
RUN apt-get install -y libcurl3-openssl-dev wget
RUN wget --no-check-certificate  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install --no-install-recommends --no-upgrade -y \
    packagekit-gtk3-module \
    libcanberra-gtk-module \
    fonts-liberation \
    libappindicator3-1 \
    libxss1 \
    xdg-utils \
    libxcb-dri3-0 \
    libx11-xcb1 \
    libgbm1 \
    libdrm2 \
    libnspr4 \
    libnss3 \
    libxtst6
RUN dpkg -i ./google-chrome-stable_current_amd64.deb
RUN rm -f ./google-chrome-stable_current_amd64.deb

RUN apt-get clean

WORKDIR /root/

RUN curl -sS https://getcomposer.org/installer | php

RUN php ~/composer.phar require guzzlehttp/guzzle:^6.2
RUN php ~/composer.phar require symfony/dom-crawler:^4.3
RUN php ~/composer.phar require symfony/css-selector:^4.3
RUN php ~/composer.phar require chrome-php/chrome:^0.8
