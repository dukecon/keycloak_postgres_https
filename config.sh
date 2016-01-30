#!/bin/bash -x

set -e

JBOSS_HOME=/opt/jboss/keycloak
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh
JBOSS_MODE=${1:-"standalone"}
JBOSS_CONFIG=${2:-"$JBOSS_MODE.xml"}

echo "==> Executing..."
cd /tmp

$JBOSS_CLI --file=`dirname "$0"`/batch.cli

# cf. http://stackoverflow.com/questions/34494022/permissions-error-when-using-cli-in-jboss-wildfly-and-docker
/bin/rm -rf ${JBOSS_HOME}/${JBOSS_MODE}/configuration/${JBOSS_MODE}_xml_history/current
