#!/bin/bash

############################################
# CHANGE THESE VALUES TO MATCH YOUR SERVER
############################################

REMOTE_SERVER=host_name
REMOTE_USER=username
REMOTE_PATH=path

############################################
# THIS IS WHERE THE MAGIC HAPPENS
############################################

rsync -ave ssh --exclude-from '.crestonignore' ./ $REMOTE_USER@$REMOTE_SERVER:$REMOTE_PATH