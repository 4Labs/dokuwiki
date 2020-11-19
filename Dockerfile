# Credits to DidierHoarau, https://github.com/splitbrain/dokuwiki/issues/1896#issuecomment-341851743

FROM php:7-apache

# Download and extract latest stable dokuwiki
RUN mkdir -p /opt/src/ \
 && cd /opt/src/ \
 && curl https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz --output source.tgz \
 && tar zxvf source.tgz \
 && rm source.tgz \
 && cp -R dokuwiki-*/. /var/www/html \
 && rm -rf dokuwiki-* \
 && chown -R www-data:www-data /var/www/html
