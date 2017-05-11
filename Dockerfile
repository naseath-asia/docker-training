FROM ubuntu:14.04

LABEL maintainer "salynaseath1986@gmail.com"

RUN apt-get update
RUN apt-get install -y w3m
RUN apt-get install -y vim
RUN apt-get install -y apache2 libapache2-mod-rpaf
RUN apt-get install -y git snmp
RUN apt-get install -y php5 \
    php5-cli \
    php5-gd \
    libapache2-mod-php5 \
    php5-memcache \
    php5-curl \
    php5-snmp \
    php5-mysql \
    php5-mcrypt \
    php5-memcached \
    php5-intl \
    php5-xsl \
    php5-imagick \
    php5-mapscript

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

#COPY . /var/www/


RUN a2enmod actions && a2enmod alias && a2enmod expires && a2enmod headers && a2enmod mpm_prefork
RUN a2enmod php5

RUN a2dissite 000-default.conf
COPY training-vhost.conf /etc/apache2/sites-enabled/


WORKDIR /var/www

RUN chown -R www-data:www-data /var/www
EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
