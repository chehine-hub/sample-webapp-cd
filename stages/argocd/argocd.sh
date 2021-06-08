#!/bin/bash

argocd login 34.152.23.230:30796 --grpc-web --username admin --password $ARGOCD_PASSWORD --insecure

argocd app get maven-project-$ENV
argocd app sync maven-project-$ENV --force --prune

argocd logout 34.152.23.230:30796
