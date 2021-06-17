FROM dockette/debian:buster

LABEL maintainer="sulcmil@gmail.com"

# PHP
ENV PHP_MODS_DIR=/etc/php/8.0/mods-available
ENV PHP_CLI_DIR=/etc/php/8.0/cli
ENV PHP_CLI_CONF_DIR=${PHP_CLI_DIR}/conf.d
ENV PHP_CGI_DIR=/etc/php/8.0/cgi
ENV PHP_CGI_CONF_DIR=${PHP_CGI_DIR}/conf.d
ENV TZ=Europe/Prague

# EXPOSE
ENV EXPOSE_PORT=8000
ENV EXPOSE_HOST=localhost
ENV EXPOSE_USERNAME=dockette
ENV EXPOSE_PASSWORD=expose
ENV EXPOSE_TOKEN=
ENV EXPOSE_ADMIN=admin
ENV EXPOSE_DB=/data/expose.db

# INSTALLATION
RUN apt update && apt dist-upgrade -y && \
    # DEPENDENCIES #############################################################
    apt install -y wget curl apt-transport-https ca-certificates git unzip && \
    # PHP DEB.SURY.CZ ##########################################################
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ buster main" > /etc/apt/sources.list.d/php.list && \
    apt update && \
    apt install -y --no-install-recommends \
        php8.0-apcu \
        php8.0-bz2 \
        php8.0-bcmath \
        php8.0-cli \
        php8.0-ctype \
        php8.0-curl \
        php8.0-mbstring \
        php8.0-sqlite3 \
        php8.0-zip && \
    # COMPOSER #################################################################
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --2 && \
    # PHP MOD(s) ###############################################################
    ln -s ${PHP_MODS_DIR}/custom.ini ${PHP_CLI_CONF_DIR}/999-custom.ini && \
    # EXPOSE APP ###############################################################
    composer create-project beyondcode/expose:1.5.1 /srv --ignore-platform-reqs --no-plugins --no-scripts && \
    chmod +x /srv/expose && \
    mkdir -p /data && \
    # CLEAN UP #################################################################
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get remove -y wget curl && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

# FILES (it overrides originals)
ADD php.ini ${PHP_MODS_DIR}/999-custom.ini

# EXPOSE APP
ADD config.php /srv/config/expose.php

# WORKDIR
WORKDIR /srv

# ENTRYPOINT
COPY entrypoint.sh /usr/bin/
RUN chmod 755 /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
