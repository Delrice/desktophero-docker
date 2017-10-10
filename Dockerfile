FROM eboraas/apache-php

COPY desktophero.conf /etc/apache2/sites-available/desktophero.conf
RUN a2dissite 000-default default-ssl && \
    a2ensite desktophero && \
    a2enmod rewrite

COPY desktophero /usr/local/desktophero/
RUN sed -i -e "s/127.0.0.1/db/" /usr/local/desktophero/config/environments.json
