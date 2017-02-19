#!/bin/bash

set -eu

image=keycloak-postgres-https:2.5.1.JavaLand

rm -rf providers
rm -rf ~/.m2/repository/org/dukecon/keycloak-doag-user-spi

mkdir providers
# mvn dependency:get  -U -Dartifact=org.dukecon:keycloak-doag-user-spi:1.0-SNAPSHOT
mvn dependency:copy -U \
	-Dartifact=org.dukecon:keycloak-doag-user-spi:1.0-SNAPSHOT \
	-DoutputDirectory=providers -DstripVersion=true -DstripClassifier=true -Dsilent=true -DoverWriteSnapshots=true

docker build \
    -t $image \
    .

docker tag -f $image ascheman/$image
