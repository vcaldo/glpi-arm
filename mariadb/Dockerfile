ARG MARIADB_VERSION
FROM mariadb:${MARIADB_VERSION}

ENV MYSQL_DATABASE glpi
ENV MYSQL_USER glpi-user
ENV MYSQL_PASSWORD glpi-pass  

COPY sql-entrypoint/ /docker-entrypoint-initdb.d/  

EXPOSE 3306