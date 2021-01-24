#!/bin/bash
set +x

/usr/bin/php /var/www/html/bin/console db:install -n --force
chown -R www-data:www-data /var/www/html/