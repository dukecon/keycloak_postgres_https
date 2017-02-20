FROM ${docker.registry.url}${docker.image.src.owner}/${docker.image.src.name}:${docker.image.src.version}

MAINTAINER Gerd Aschemann <gerd@aschemann.net>

ADD config.sh /tmp/
ADD batch.cli /tmp/

ADD themes /opt/jboss/keycloak/themes
ADD maven/providers /opt/jboss/keycloak/providers

RUN bash /tmp/config.sh
