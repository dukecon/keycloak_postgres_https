#!/bin/bash -x

JBOSS_HOME=/opt/jboss/keycloak
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh
JBOSS_MODE=${1:-"standalone"}
JBOSS_CONFIG=${2:-"$JBOSS_MODE.xml"}

echo "==> Executing..."
cd /tmp
$JBOSS_CLI --file=`dirname "$0"`/batch.cli