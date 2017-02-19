FROM jboss/keycloak-postgres:2.5.1.Final

MAINTAINER Gerd Aschemann <gerd@aschemann.net>

ADD config.sh /tmp/
ADD batch.cli /tmp/

ADD themes/javaland /opt/jboss/keycloak/themes/javaland
ADD providers /opt/jboss/keycloak/providers

RUN /tmp/config.sh
