#!/bin/bash
set -x

curl -L "https://github.com/pluginsGLPI/genericobject/releases/download/2.9.1/glpi-genericobject-2.9.1.tar.bz2" | tar -jxf - -C /var/www/html/plugins/
curl -L "https://github.com/pluginsGLPI/fields/releases/download/1.12.0/glpi-fields-1.12.0.tar.bz2" | tar -jxf - -C /var/www/html/plugins/
curl -L "https://github.com/pluginsGLPI/datainjection/releases/download/2.8.1/glpi-datainjection-2.8.1.tar.bz2" | tar -jxf - -C /var/www/html/plugins/ && mkdir -p /var/www/html/files/_plugins/datainjection/
curl -L "https://github.com/pluginsGLPI/formcreator/releases/download/v2.10.3/glpi-formcreator-2.10.3.tar.bz2" | tar -jxf - -C /var/www/html/plugins/
curl -L "https://github.com/pluginsGLPI/ocsinventoryng/releases/download/1.7.1/glpi-ocsinventoryng-1.7.1.tar.gz" | tar -zxf - -C /var/www/html/plugins/
curl -L "https://github.com/stdonato/glpi-modifications/archive/2.0.2.tar.gz" | tar -zxf - -C /var/www/html/plugins/ && mv /var/www/html/plugins/glpi-modifications-2.0.2 /var/www/html/plugins/mod

# Working but no in use
# curl -L "https://github.com/pluginsGLPI/telegrambot/releases/download/2.0.0/glpi-telegrambot-2.0.0.tar.bz2" | tar -jxf - -C /var/www/html/plugins/
# curl -L "https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.5.0%2B1.0/fusioninventory-9.5.0+1.0.tar.bz2" | tar -jxf - -C /var/www/html/plugins/
# curl -L "https://github.com/InfotelGLPI/tasklists/releases/download/1.6.0/glpi-tasklists-1.6.0.tar.gz" | tar -zxf - -C /var/www/html/plugins/ 
# curl -L "https://github.com/pluginsGLPI/tag/releases/download/2.7.0/glpi-tag-2.7.0.tar.bz2" | tar -jxf - -C /var/www/html/plugins/

# Not working on 9.5
# curl -L "https://forge.glpi-project.org/attachments/download/2316/glpi-behaviors-2.4.1.tar.gz" | tar -zxf - -C /var/www/html/plugins/
# curl -L "https://github.com/ticgal/costs/releases/download/1.3.0/costs-1.3.0.tar.tgz" | tar -zxf - -C /var/www/html/plugins/
# curl -L "https://forge.glpi-project.org/attachments/download/2293/glpi-pdf-1.6.0.tar.gz" | tar -zxf - -C /var/www/html/plugins/

# Fix GLPI API generic object bug PluginsAutoload
sed -i 's/return include($test);/return include_once($test);/g' $(ls /var/www/html/plugins/*/inc/autoload.php)

/usr/bin/php /var/www/html/bin/console glpi:plugin:install -a -u glpi
/usr/bin/php /var/www/html/bin/console glpi:plugin:activate -a


chown -R www-data:www-data /var/www/html/