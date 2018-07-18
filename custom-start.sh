#!/bin/sh

if [ ! -f /var/www/html/data/index.php ]; then
  echo "Init data folder"
  cp -R /opt/src/dokuwiki-*/data/* /var/www/html/data/
  cp -R /opt/src/dokuwiki-*/data/.htaccess /var/www/html/data/
  chown -R www-data /var/www/html
fi

docker-php-entrypoint apache2-foreground
