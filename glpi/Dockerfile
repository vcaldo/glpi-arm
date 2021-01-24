FROM ubuntu

ARG VERSION
ENV MARIADB_HOST mariadb-glpi
ENV MARIADB_PORT 3306
ENV MARIADB_DATABASE glpi
ENV MARIADB_USER glpi-user
ENV MARIADB_PASSWORD glpi-pass
ENV TIMEZONE America/Sao_Paulo
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /var/www/html

RUN apt -y update \
    && apt -y upgrade \
    && apt install --yes --no-install-recommends \
    apache2 \
    php \
    php-mysql \
    php-ldap \
    php-xmlrpc \
    php-imap \
    curl \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-apcu-bc \
    php-cas \
    php-intl \
    php-zip \
    php-bz2 \
    php-yaml \
    wget \
    ca-certificates \
    jq \
    wget \
		git \
		bzip2 \
		unzip \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/glpi-project/glpi/releases/download/${VERSION}/glpi-${VERSION}.tgz /tmp/
RUN tar -zxf /tmp/glpi-${VERSION}.tgz -C /tmp/ \
	&& mv /tmp/glpi/* /var/www/html/ \
	&& chown -R www-data:www-data /var/www/html \
	&& rm -rf /tmp/glpi-${VERSION}.tgz

ADD assets/php.d /etc/php.d
ADD assets/apache/000-default.conf /etc/apache2/sites-available/
RUN rm -rf /var/www/html/index.html
RUN a2enmod rewrite

ADD assets/htaccess install/.htaccess
RUN rm -f /var/www/html/install/install.php
ADD assets/scripts/ /opt/
RUN chmod 755 /opt/*.sh

RUN cp -pdrf /var/www/html /glpi-mount

EXPOSE 80/tcp
CMD ["/opt/glpi-entrypoint.sh"]    