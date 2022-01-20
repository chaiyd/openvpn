# openvpn

### 添加SNAT
`iptables -t nat -A POSTROUTING -s 172.16.1.0/24 -o eth0 -j MASQUERADE`

### 说明
- 镜像已经初步完善，已经实现自动创建证书等服务
- 通过判断/etc/openvpn/key 目录是否为空要确定是否创建证书
- 默认证书有效期更改为3650
