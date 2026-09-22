#!/bin/bash

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

# Install persistence
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables-persistent

# Configure NAT
iptables -t nat -A POSTROUTING -o ens4 -j MASQUERADE

# Allow forwarding
iptables -A FORWARD -i ens4 -j ACCEPT
iptables -A FORWARD -o ens4 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Persist rules
netfilter-persistent save