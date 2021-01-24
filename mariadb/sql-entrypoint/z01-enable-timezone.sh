#!/bin/bash
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -p${MYSQL_ROOT_PASSWORD} -u root mysql