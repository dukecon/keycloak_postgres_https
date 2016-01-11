#!/bin/bash

image=keycloak-postgres-https:1.7.0.Final

exec docker build \
    -t ascheman/$image -t $image \
    .
