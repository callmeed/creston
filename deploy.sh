#!/bin/bash

############################################
# WELCOME TO CRESTON
############################################
# Usage: 
# 1. copy this file and .crestonignore
#    to the root of your Rails app
# 2. edit the values below to set your 
#    server info
# 3. call deploy.sh rvm if you're using
#    rvm or just deploy.sh if your server
#    has ruby built from source
# 
# Latest info at: 
#    https://github.com/callmeed/creston

############################################
# CHANGE THESE VALUES TO MATCH YOUR SERVER
############################################

REMOTE_SERVER="host_name.com"
REMOTE_USER="username"
REMOTE_PATH="path"
RVM_SOURCE_PATH="/usr/local/rvm/environments/ruby-2.0.0-p353"

############################################
# THIS IS WHERE THE MAGIC HAPPENS
############################################

# Preparation: Check for RVM and set commands accordingly 
echo "===== DEPLOYING TO $REMOTE_SERVER ... ====="
if [ "$1" == "rvm" ]
then
  echo "(RVM SET)"
  BUNDLE_CMD="source $RVM_SOURCE_PATH && cd $REMOTE_PATH && bundle install"
  MIGRATE_CMD="source $RVM_SOURCE_PATH && cd $REMOTE_PATH && bundle exec rake db:migrate RAILS_ENV=production"
else
  BUNDLE_CMD="cd $REMOTE_PATH && bundle install"
  MIGRATE_CMD="cd $REMOTE_PATH && bundle exec rake db:migrate RAILS_ENV=production"
fi

# Step 1: Rsync
rsync -ave ssh --exclude-from '.crestonignore' ./ $REMOTE_USER@$REMOTE_SERVER:$REMOTE_PATH

# Step 2: Bundle
echo "===== BUNDLING ... ====="
ssh $REMOTE_USER@$REMOTE_SERVER "$BUNDLE_CMD"

# Step 3: Migrate
echo "===== MIGRATING ... ====="
ssh $REMOTE_USER@$REMOTE_SERVER "$MIGRATE_CMD"