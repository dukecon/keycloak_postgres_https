FROM jboss/keycloak-postgres:1.7.0.Final

MAINTAINER Gerd Aschemann <gerd@aschemann.net>

ADD config.sh /tmp/
ADD batch.cli /tmp/

ADD themes/javaland /opt/jboss/keycloak/standalone/configuration/themes/javaland

RUN /tmp/config.sh
