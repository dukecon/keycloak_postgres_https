#!/bin/bash

set -e

image=keycloak-postgres-https:2.5.1.JavaLand

docker build \
    -t $image \
    .

docker tag -f $image ascheman/$image
