FROM dunglas/frankenphp

RUN install-php-extensions \
    pdo_mysql \
    gd \
    intl \
    zip

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]