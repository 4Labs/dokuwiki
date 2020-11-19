#!/bin/sh

# Dokuwiki mixes code, plugins and themes in the same directories, so we must update volumes
echo "update volumes"
cp -ru /opt/src/dokuwiki-*/data/* /var/www/html/data/
cp -ru /opt/src/dokuwiki-*/lib/tpl/* /var/www/html/lib/tpl/
cp -ru /opt/src/dokuwiki-*/lib/plugins/* /var/www/html/lib/plugins/
cp /opt/src/dokuwiki-*/data/.htaccess /var/www/html/data/
chown -R www-data:www-data /var/www/html

echo "Starting httpd"
docker-php-entrypoint apache2-foreground