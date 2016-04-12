#!/bin/bash

# It's possible we're in a network that contains an appropriate container.  If
# we're not then just fail out at this point.  Previously we relied on linking
# in a container but this is deprecated in Docker 1.9.
if [[ ! -v $POSTGRESQL_HOST ]]; then
  getent hosts foreman-postgresql && POSTGRESQL_HOST=foreman-postgresql || echo "POSTGRESQL_HOST must be set."
fi

# Set the database host to use.
echo "  host: ${POSTGRESQL_HOST}" >> /usr/share/foreman/config/database.yml
# Make sure we enable the locations support.
sed -i 's/:locations_enabled: false/:locations_enabled: true/g' /usr/share/foreman/config/settings.yaml

cd /usr/share/foreman

# Migrate the db
RAILS_ENV=production bundle exec rake db:migrate
# Build the assets at runtime.
RAILS_ENV=production bundle exec rake assets:precompile locale:pack

if [ ! -f "/foreman/.first_run" ]; then
  RAILS_ENV=production bundle exec rake db:seed
  RAILS_ENV=production bundle exec rake permissions:reset # Outputs the admin password.
  echo "PASSWORD IS ABOVE ^^^^^"
  touch /foreman/.first_run
fi

# Set the hostname every time.
sed -i "s/REPLACE_HOSTNAME/${VHOST_NAME:?ERROR: VHOST_NAME env var not set}/g" /etc/nginx/sites-enabled/foreman.conf

# Build the API cache every startup. :(
RAILS_ENV=production bundle exec rake apipie:cache

# Fix all permissions for passenger, clumsy hack
chown -R app /usr/share/foreman
