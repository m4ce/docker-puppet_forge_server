#
# Dockerfile
#
# Author: Matteo Cerutti <matteo.cerutti@hotmail.co.uk>
#

FROM centos:7
MAINTAINER Matteo Cerutti <matteo.cerutti@hotmail.co.uk>

ENV PUPPET_FORGE_SERVER_BASEDIR /srv/puppet-forge-server

RUN yum install gcc make ruby-devel rubygems -y
RUN wget http://github.com/unibet/puppet-forge-server/archive/master.tar.gz -O /tmp/puppet-forge-server-master.tar.gz && tar xvzf /tmp/puppet-forge-server-master.tar.gz -C /tmp && cd /tmp/puppet-forge-server-master && gem build puppet-forge-server.gemspec && gem install --local *.gem

# Needed to fetch dependencies
RUN gem install puma
RUN mkdir -p $PUPPET_FORGE_SERVER_BASEDIR

ADD run.sh /run.sh

WORKDIR $PUPPET_FORGE_SERVER_BASEDIR
ENTRYPOINT ["/run.sh"]
