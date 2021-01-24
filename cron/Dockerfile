FROM local/glpi

RUN apt update && \
    apt -y install cron mariadb-client \
    cron

ADD assets/crontab /etc/cron.d/glpi-backup
RUN chmod 0644 /etc/cron.d/glpi-backup
RUN crontab /etc/cron.d/glpi-backup
RUN touch /var/log/cron.log

ADD assets/entrypoint.sh /opt
ADD assets/glpi-backup.sh /root/
RUN chmod 0755 /opt/entrypoint.sh /root/glpi-backup.sh

CMD [ "/opt/entrypoint.sh" ]
