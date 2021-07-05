#! /bin/sh

#--------------------------Configuracoes gerais-------------------------------------

iptables -F -t -nat 
iptables -F -t filter 
iptables -F -t mangle 

#--------------------------Rede Local <-> Internet----------------------------------


#-------------------------Firewall <-> Internet-------------------------------------
# Permitir a saida de Ping do Firewall 

iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

# Permitir a Saida de consulta DNS (tem que identificar as portas pelo comando ifconfig | less)

iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT

# Permitir a saida para web

iptables -A OUTPUT -p tcp  --dport 80 -j ACCEPT
iptables -A INPUT -p tcp  --sport 80 -j ACCEPT
iptables -A OUTPUT -p tcp  --dport 443 -j ACCEPT
iptables -A INPUT -p tcp  --sport 443 -j ACCEPT