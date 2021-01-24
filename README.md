# GLPI Docker - ARM Build
This is a [GLPI](https://github.com/glpi-project/glpi) ARM build.
## Build
There are pre-build images for arm64 at my [Docker Hub repo](https://hub.docker.com/repository/docker/vcaldo/glpi), but you can build any GLPI or MariaDB version setting the build-arg as the example below.

```
docker build --build-arg VERSION=9.5.3 -t local/glpi glpi
docker build -t local/glpi-cron cron
docker build --build-arg MARIADB_VERSION=10.5 -t local/glpi-mariadb mariadb
```

## Fresh Install
Edit the `docker-compose.yml` file to set anything that you need like the timezone, then run the following commands:

```
docker-compose up -d
docker exec glpi /opt/glpi-fresh-install.sh
docker exec glpi /opt/glpi-plugins.sh
```
GLPI should be available at http://server_ip:8080 

Use glpi for both user and password.
## Restore Previous DB
Mount a directory containing the database dump inside Mariadb container in `/docker-entrypoint-initdb.d` and deploy the stack using the `docker-compose.yml`

If you are restoring from a previous GLPI version run:
`php bin/console glpi:database:update`
