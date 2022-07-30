# Startup from alpine
FROM alpine:3.13
LABEL Maintainer = "Hilman Maulana, BangAchil"
LABEL Description = "Mikhbotam is a web-based application that combines Mikrotik and Telegram bot with the main function as hotspot management using a Telegram bot."

# Setup document root
WORKDIR /var/www/html

# Expose the port nginx is reachable on
EXPOSE 80

# Install packages
RUN apk add --no-cache \
    nginx \
    php7 \
    php7-fpm \
    php7-gd \
    php7-mbstring \
    php7-mysqli \
    php7-session \
    php7-pdo_sqlite \
    sqlite \
    supervisor

# Configure nginx and remove default server definition
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf

# Configure PHP-FPM
COPY conf/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY conf/php.ini /etc/php7/conf.d/custom.ini

# Configure supervisord
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Setup document root
RUN mkdir -p /var/www/html

# Create grup and user for mikbotam
RUN addgroup mikbotam && adduser -DH -G mikbotam mikbotam

# Make sure files/folders needed by the processes are accessable when they run under the mikbotam user
RUN chown -R mikbotam.mikbotam /var/www/html /run /var/lib/nginx /var/log/nginx

# Switch to use a mikbotam user from here on
USER mikbotam

# Add application
COPY --chown=mikbotam src/ /var/www/html/

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
