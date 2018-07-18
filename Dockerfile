# Credits to DidierHoarau, https://github.com/splitbrain/dokuwiki/issues/1896#issuecomment-341851743

FROM php:7.0-apache
 
COPY dokuwiki.tgz /opt/src/dokuwiki.tgz
COPY custom-start.sh /custom-start.sh
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
 
RUN chmod +x /custom-start.sh && \
    cd /opt/src/ && \
    tar zxf dokuwiki.tgz && \
    rm -rf /var/www/html && \
    cp -R dokuwiki-* /var/www/html && \
    chown -R www-data:www-data /var/www/html

CMD ["/custom-start.sh"]
