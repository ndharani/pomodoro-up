#!/bin/sh

set -e

echo "Environment: $RAILS_ENV"
echo "GEM_HOME: $GEM_HOME"

# install missing gems
bundle check || bundle install --jobs 20 --retry 5
echo "Bundle checked"

# Remove pre-existing puma/passenger server.pid
rm -f $APP_PATH/tmp/pids/server.pid
echo "Removed server.pid"

# run passed commands
bundle exec ${@}
