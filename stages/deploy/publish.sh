#!/bin/bash

export BUILD_TAG=$(sed -n '1p' /opt/.auth)
export ENV=$(sed -n '2p' /opt/.auth)
export DOCKER_HUB_USERNAME=$(sed -n '3p' /opt/.auth)
export DOCKER_HUB_PASSWORD=$(sed -n '4p' /opt/.auth)
export DOCKER_HUB_ACCOUNT=$(sed -n '5p' /opt/.auth)

docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD
docker pull $DOCKER_HUB_ACCOUNT/maven-project-$ENV:$BUILD_TAG
cd /opt/ && docker-compose up -d --force-recreate
