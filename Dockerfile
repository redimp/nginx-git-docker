#
# production stage
#
FROM nginx:1.23.1

LABEL maintainer="Ralph Thesen <mail@redimp.de>"
# install python environment
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    apt-get install -y git fcgiwrap apache2-utils supervisor && \
    apt-get clean  && rm -rf /var/lib/apt/lists/*

VOLUME /repositories

COPY supervisord.conf /etc/supervisor/conf.d/
COPY stop-supervisor.sh /etc/supervisor/
COPY default.conf /etc/nginx/conf.d/default.conf

RUN chown -R www-data:www-data /repositories && \
    chmod 0755 /etc/supervisor/stop-supervisor.sh

# # configure the entrypoint
# ENTRYPOINT ["/entrypoint.sh"]
# # and the default command: supervisor which takes care of nginx and uWSGI
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# vim:set et ts=8 sts=2 sw=2 ai fenc=utf-8: 
