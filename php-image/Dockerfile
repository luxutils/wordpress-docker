FROM php:5.6-apache

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

ENV WWWGROUP=${WWWGROUP:-1000}
WORKDIR /var/www/html

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Vilnius
ENV ACCEPT_EULA=Y

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y curl gnupg2 && \
    chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd zip bcmath intl imagick pdo_mysql mysqli exif calendar opcache && \
    apt-get update && apt-get install -y procps git zip unzip mariadb-client && apt-get -y upgrade && \
    docker-php-source delete && \
    apt-get -y autoremove && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


COPY php.ini /tmp/config.ini
COPY docker-php.conf /etc/apache2/conf-available/docker-php.conf
COPY wp-config.php /tmp/wp-config-docker.php
RUN mv "/tmp/config.ini" "$PHP_INI_DIR/conf.d/wp-conf.ini"
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

RUN groupmod -g ${WWWGROUP} www-data
COPY init.sh /init.sh
RUN chmod +x /init.sh
EXPOSE 80
ENTRYPOINT ["/init.sh"]
