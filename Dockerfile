FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y iptables iproute2 net-tools inetutils-ping dnsmasq

ADD run.sh /run.sh

VOLUME /var/lib/misc/

CMD /run.sh
