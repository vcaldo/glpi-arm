USE mysql;
CREATE USER 'grafana'@'%' IDENTIFIED BY 'DhTeqh67gGWmv9WeNaN';
GRANT SELECT ON glpi.* TO 'grafana'@'%';
FLUSH PRIVILEGES;
