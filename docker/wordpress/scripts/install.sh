#!/bin/bash

source /var/www/html/.env

echo ${WP_TITLE}
echo Install to ${WP_SITEURL}

echo 'Wating to connect Database.'
while ! wp db check --allow-root;
do
  >&2 echo -n "."
  sleep 1
done

echo 'Success to connect databace!';

# Install WordPress
#=======================
wp core install \
--url="$WP_SITEURL" \
--title="$WP_TITLE" \
--admin_user="$WP_ADMIN_USER" \
--admin_password="$WP_ADMIN_PASSWORD" \
--admin_email="$WP_ADMIN_EMAIL" \
--allow-root

# Language JP
wp language core install --allow-root --activate ja

echo ACCESS ${WP_HOME}
echo LOGIN ${WP_SITEURL}/wp-admin
echo ADMIN ${WP_ADMIN_USER}
echo PASSWORD ${WP_ADMIN_PASSWORD}
