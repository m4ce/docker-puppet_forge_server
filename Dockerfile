#
# Dockerfile
#
# Author: Matteo Cerutti <matteo.cerutti@hotmail.co.uk>
#

FROM centos:7

RUN yum install gcc make ruby-devel rubygems -y

# Needed to fetch dependencies
RUN echo ':ssl_verify_mode: 0' > ~/.gemrc
RUN gem install puppet-forge-server -v 1.8.0
RUN mkdir -p /srv/puppet-forge-server

ADD run.sh /run.sh

WORKDIR /srv/puppet-forge-server

ENTRYPOINT ["/run.sh"]
