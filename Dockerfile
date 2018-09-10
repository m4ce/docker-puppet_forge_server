#
# Dockerfile
#
# Author: Matteo Cerutti <matteo.cerutti@hotmail.co.uk>
#

FROM centos:7
MAINTAINER Matteo Cerutti <matteo.cerutti@hotmail.co.uk>

ENV PUPPET_FORGE_SERVER_BASEDIR /srv/puppet-forge-server
ENV PUPPET_FORGE_SERVER_VERSION 1.10.0

RUN yum install gcc make ruby-devel rubygems -y

# Needed to fetch dependencies
RUN gem install puppet-forge-server -v $PUPPET_FORGE_SERVER_VERSION
RUN gem install puma
RUN mkdir -p $PUPPET_FORGE_SERVER_BASEDIR

ADD run.sh /run.sh

WORKDIR $PUPPET_FORGE_SERVER_BASEDIR
ENTRYPOINT ["/run.sh"]
