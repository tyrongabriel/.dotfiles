#!/bin/bash
# To make persistent, use apt install iptables-persistent
# Files in /etc/iptables/
# Variables
SSH_PORT=22022
LIMIT_BURST=5
LIMIT_DELAY=120 # 120seconds 

# Flush existing rules
iptables -F

# Set the default policies to DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow SSH on the specified port with rate-limiting
iptables -A INPUT -p tcp --dport $SSH_PORT -m state --state NEW -m recent --set --name SSH
iptables -A INPUT -p tcp --dport $SSH_PORT -m state --state NEW -m recent --update --seconds $LIMIT_DELAY --hitcount $LIMIT_BURST --rttl --name SSH -j DROP
iptables -A INPUT -p tcp --dport $SSH_PORT -j ACCEPT

# Allow Pings
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

echo "Iptables configuration complete."
#iptables-save # if using iptables-persistent
#echo "Saved configuration to be persistent"
