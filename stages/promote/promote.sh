#!/bin/bash

echo "******************************"
echo "******* Pushing image ********"
echo "******************************"

docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD
docker tag maven-project-$ENV:$BUILD_TAG $DOCKER_HUB_ACCOUNT/maven-project-prod:$BUILD_TAG
docker push $DOCKER_HUB_ACCOUNT/maven-project-prod:$BUILD_TAG
