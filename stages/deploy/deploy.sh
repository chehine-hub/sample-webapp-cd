#!/bin/bash

echo "********pass ENV*******"

echo $BUILD_TAG > /tmp/.auth
echo $ENV >> /tmp/.auth
echo $DOCKER_HUB_USERNAME >> /tmp/.auth
echo $DOCKER_HUB_PASSWORD >> /tmp/.auth
echo $DOCKER_HUB_ACCOUNT >> /tmp/.auth

echo "********Copy ENV file*******"
scp -i /opt/deploy-vm /tmp/.auth root@34.95.5.161:/opt/.auth

echo "***********Copy publish script********"
scp -i /opt/deploy-vm ./stages/deploy/publish.sh root@34.95.5.161:/opt/publish.sh

echo "***********Copy docker-compose file********"
scp -i /opt/deploy-vm ./stages/deploy/docker-compose.yml root@34.95.5.161:/opt/docker-compose.yml

echo "*********Launch publish acript**********"
ssh -i /opt/deploy-vm root@34.95.5.161 "/opt/publish.sh"
