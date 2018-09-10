#
# Dockerfile
#
# Author: Matteo Cerutti <matteo.cerutti@hotmail.co.uk>
#

FROM ruby:2.4-slim
MAINTAINER Matteo Cerutti <matteo.cerutti@hotmail.co.uk>

ENV PUPPET_FORGE_SERVER_BASEDIR /srv/puppet-forge-server
ENV PUPPET_FORGE_SERVER_VERSION 1.10.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc make ruby-dev rubygems && \
    rm -rf /var/lib/apt/lists/*

# Needed to fetch dependencies
RUN gem install puppet-forge-server -v $PUPPET_FORGE_SERVER_VERSION && \
    gem install puma && \
    mkdir -p $PUPPET_FORGE_SERVER_BASEDIR && \
    apt-get purge -y --auto-remove make gcc ruby-dev

ADD run.sh /run.sh

WORKDIR $PUPPET_FORGE_SERVER_BASEDIR
ENTRYPOINT ["/run.sh"]
