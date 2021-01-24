#!/bin/sh

NOW=`date +%Y-%m-%d-%H-%M`

if [ -z $MARIADB_DATABASE ]; then 
  MARIADB_DATABASE="glpi"
fi

if [ -z $MARIADB_HOST ]; then
  MARIADB_HOST="mariadb-glpi"
fi

if [ -z $MARIADB_PASSWORD ]; then
  MARIADB_PASSWORD="glpi-pass"
fi

if [ -z $MARIADB_PORT ]; then
  MARIADB_PORT="3306"
fi

if [ -z $MARIADB_USER ]; then
  MARIADB_USER="glpi-user"
fi

/bin/mysqldump -h $MARIADB_HOST -P $MARIADB_PORT -u $MARIADB_USER -p$MARIADB_PASSWORD --single-transaction --databases $MARIADB_DATABASE -r /var/www/html/files/_dumps/glpi-backup-${NOW}.sql
/bin/tar -czf /var/www/html/files/_dumps/glpi-backup-${NOW}.tgz -C /var/www/html/files/_dumps/ glpi-backup-${NOW}.sql
/bin/rm -f /var/www/html/files/_dumps/glpi-backup-${NOW}.sql

if [ $? -eq 0 ]; then

  chown -R www-data:www-data /var/www/html/files/_dumps/glpi-backup-${NOW}.tgz

  ls -lh /var/www/html/files/_dumps/glpi-backup-${NOW}.tgz

fi

/bin/find /var/www/html/files/_dumps/ -mtime +30 -delete
