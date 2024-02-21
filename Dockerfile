FROM dunglas/frankenphp

ENV XDG_CONFIG_HOME /home/container/caddy/config
ENV XDG_DATA_HOME /home/container/caddy/data

RUN install-php-extensions \
    pdo_mysql \
    gd \
    intl \
    zip

COPY ./Caddyfile.base /etc/caddy/Caddyfile
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER container
ENV USER container
ENV HOME /home/container

WORKDIR /home/container

CMD ["/bin/bash", "/entrypoint.sh"]
