#
# Dockerfile
#
# Author: Matteo Cerutti <matteo.cerutti@hotmail.co.uk>
#

FROM centos:7
MAINTAINER Matteo Cerutti <matteo.cerutti@hotmail.co.uk>

ENV PUPPET_FORGE_SERVER_BASEDIR /srv/puppet-forge-server

RUN yum install gcc make ruby-devel rubygems git rubygem-bundler -y
RUN cd /tmp && git clone http://github.com/unibet/puppet-forge-server && cd puppet-forge-server && gem build puppet-forge-server.gemspec && bundle install

# Needed to fetch dependencies
RUN gem install puma
RUN mkdir -p $PUPPET_FORGE_SERVER_BASEDIR

ADD run.sh /run.sh

WORKDIR $PUPPET_FORGE_SERVER_BASEDIR
ENTRYPOINT ["/run.sh"]
