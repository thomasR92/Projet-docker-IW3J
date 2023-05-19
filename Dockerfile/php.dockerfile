FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories &&\
    apk add --no-cache php8 \
    php8 php8-fpm \ 
    php8-opcache \
    php8-json\
    php8-openssl\
    php8-curl\
    php8-zip \
    php8-mbstring \
    php8-phar \
    php8-iconv \
    php8-ctype\
    php8-session\
    php8-tokenizer\
    php8-xml \
    php8-pgsql \
    php8-pdo_pgsql

# Create a symbolic link for the php executable
RUN ln -s /usr/bin/php8 /usr/bin/php

RUN php -v

WORKDIR /var/www/html

