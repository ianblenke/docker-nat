#!/bin/bash -xe
IPV4_ADDRESS=${IPV4_ADDRESS:-10.22.0.1/22}
ip address flush dev eth1
ip addr add $IPV4_ADDRESS dev eth1
ip addr show
iptables -L -n
echo 1 > /proc/sys/net/ipv4/ip_forward
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
/sbin/iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

exec dnsmasq --interface=eth1 --dhcp-authoritative --keep-in-foreground --user=root --no-daemon
