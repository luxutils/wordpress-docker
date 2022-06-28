#!/usr/bin/env bash

# Install wordpress if not installed
if [ -z "$(ls -A /var/www/html/wp-admin)" ]; then
  echo "Wordpress is not installed, installing..."
  cd /var/www/html
  curl https://wordpress.org/latest.zip -o /tmp/wordpress.zip
  unzip /tmp/wordpress.zip -d /tmp/
  mv /tmp/wordpress/* .
  rm -rf /tmp/wordpress
  rm /tmp/wordpress.zip
  echo "Wordpress installed"
else
  echo "Wordpress is already installed"
fi

# Copy default wp-config if not exists
if [ ! -f /var/www/html/wp-config.php ]; then
  echo "Copying default config..."
  cp /tmp/wp-config-docker.php /var/www/html/wp-config.php
  echo "Copied default config"
fi

# Take ownership of the files
chown -R www-data:www-data /var/www/html

# Allow group to edit files
chmod -R g+w /var/www/html

/usr/local/bin/apache2-foreground
