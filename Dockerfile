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

RUN \
	# Add additional capability to bind to port 80 and 443
	setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/frankenphp;
 
ENV USER container
ENV HOME /home/container

WORKDIR /home/container

CMD ["/bin/bash", "/entrypoint.sh"]
