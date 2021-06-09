#!/bin/bash

argocd login 34.152.23.230:30796 --grpc-web --username admin --password $ARGOCD_PASSWORD --insecure

argocd app set maven-project-$ENV --kustomize-images $DOCKER_HUB_ACCOUNT/maven-project-$ENV:$BUILD_TAG
argocd app sync maven-project-$ENV --force --prune

argocd logout 34.152.23.230:30796
