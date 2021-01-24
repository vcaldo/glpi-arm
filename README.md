# GLPI Docker - Arm Build

## Build
You can build any GLPI or MariaDB version setting the build-arg as the example bellow.

```
docker build --build-arg VERSION=9.5.3 -t local/glpi glpi
docker build -t local/glpi-cron cron
docker build --build-arg MARIADB_VERSION=10.5 -t local/glpi-mariadb mariadb
```

## Fresh Install
Deploy the stack using the `docker-compose.yml` then run the following command inside the GLPI container:

```
docker-compose up -d
docker exec glpi /opt/glpi-fresh-install.sh
docker exec glpi /opt/glpi-plugins.sh
```
## Restore Previous DB
Mount a directory containing the database dump inside Mariadb container in `/docker-entrypoint-initdb.d` and deploy the stack using the `docker-compose.yml`

If you are restoring from a previous GLPI version run:
`php bin/console glpi:database:update`
