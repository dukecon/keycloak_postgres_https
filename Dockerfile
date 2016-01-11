FROM jboss/keycloak-postgres:1.7.0.Final

MAINTAINER Gerd Aschemann <gerd@aschemann.net>

ADD standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml