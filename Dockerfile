FROM jboss/keycloak-postgres:1.7.0.Final

MAINTAINER Gerd Aschemann <gerd@aschemann.net>

ADD config.sh /tmp/
ADD batch.cli /tmp/

RUN /tmp/config.sh