#!/bin/bash

set -e

image=keycloak-postgres-https:1.8.0.JavaLand

docker build \
    -t $image \
    .

docker tag -f $image ascheman/$image
