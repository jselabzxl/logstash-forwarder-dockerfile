# logstash-forwarder
#
# A tool to collect logs locally in preparation for processing elsewhere
#
# VERSION               0.3.1

FROM      debian:jessie
MAINTAINER linhaobuaa "linhao.lh@qq.com"

ENV DEBIAN_FRONTEND noninteractive

# RUN apt-get update

# clone logstash-forwarder
RUN mkdir /opt/forwarder
ADD logstash-forwarder_linux_amd64 /opt/forwarder/logstash-forwarder_linux_amd64
RUN chmod 777 /opt/forwarder/logstash-forwarder_linux_amd64

ADD start_forwarder.sh /usr/local/bin/start_forwarder.sh
RUN chmod 755 /usr/local/bin/start_forwarder.sh

RUN mkdir /opt/conf
ADD conf-example /opt/conf

RUN mkdir /opt/certs
ADD certs /opt/certs

VOLUME ["/tmp/feeds"]

CMD /usr/local/bin/start_forwarder.sh

