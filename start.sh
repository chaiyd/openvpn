#!/bin/sh

#mkdir /dev/net
#mknod /dev/net/tun c 10 200

#if [ ! -d /etc/openvpn/key ]; then
if [ "`ls /etc/openvpn/key`" = "" ]; then
        cat <<EOF > /usr/share/easy-rsa/vars
         ##证书有效期
         set_var EASYRSA_CA_EXPIRE	3650
         set_var EASYRSA_CERT_EXPIRE	3650
EOF

        easyrsa init-pki
	easyrsa --batch build-ca nopass
	easyrsa build-server-full server nopass
	easyrsa build-client-full client nopass
	easyrsa gen-dh
	mkdir /etc/openvpn/key
        openvpn --genkey secret /etc/openvpn/key/ta.key	
	cp pki/private/server.key /etc/openvpn/key/
        cp pki/issued/server.crt /etc/openvpn/key/ 
	cp pki/ca.crt /etc/openvpn/key/
	cp pki/dh.pem /etc/openvpn/key/
	#cp -r pki /etc/openvpn/
        exec openvpn --config /etc/openvpn/server.conf
else
	exec openvpn --config /etc/openvpn/server.conf
fi
