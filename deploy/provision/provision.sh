#!/bin/bash

bash $WORKING_DIR/deploy/provision/packages.sh
if [ "$DEPLOYMENT" == "dev" ]; then
    bash $WORKING_DIR/deploy/provision/dev.sh
fi
bash $WORKING_DIR/deploy/provision/nginx.sh
bash $WORKING_DIR/deploy/provision/uwsgi.sh
bash $WORKING_DIR/deploy/provision/virtualenv.sh

# Restart the services
systemctl restart uwsgi
systemctl restart nginx
