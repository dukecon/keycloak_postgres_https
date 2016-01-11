#!/bin/bash

set -e

image=keycloak-postgres-https:1.7.0.Final

docker build \
    -t $image \
    .

docker tag -f $image ascheman/$image
