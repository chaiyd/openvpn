#!/bin/sh

mkdir /dev/net
mknod /dev/net/tun c 10 200

openvpn --config /etc/openvpn/server.conf

tail -f /etc/openvpn/server-openvpn.log 
