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
RUN mkdir -p /opt/puppet-forge-server

ADD run.sh /run.sh

EXPOSE 8080

WORKDIR /opt/puppet-forge-server

ENTRYPOINT ["/run.sh"]
