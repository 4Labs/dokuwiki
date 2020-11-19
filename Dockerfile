FROM php:7-apache

COPY startup.sh /startup.sh

# Download and extract latest stable dokuwiki
RUN mkdir -p /opt/src/ \
 && cd /opt/src/ \
 && curl https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz --output source.tgz \
 && tar zxvf source.tgz \
 && rm source.tgz \
 && cp -R dokuwiki-*/. /var/www/html \
 && chown -R www-data:www-data /var/www/html \
 && chmod +x /startup.sh

CMD ["/startup.sh"]
