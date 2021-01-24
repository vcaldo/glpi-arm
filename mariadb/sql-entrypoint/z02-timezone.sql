USE mysql
GRANT SELECT ON `mysql`.`time_zone_name` TO 'glpi-user'@'%';
FLUSH PRIVILEGES;