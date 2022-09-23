# Configuración Site "A"
/ip firewall filter
add action=accept chain=input protocol=udp dst-port=1701,500,4500
    place-before=0
add action=accept chain=input protocol=ipsec-esp place-before=1

/interface l2tp-server server
set authentication=mschap2 enabled=yes ipsec-secret=ipseclab
    use-ipsec=required

/ppp secret
add name=l2tplab password=l2tplab service=l2tp local-address=10.100.0.1
    remote-address=10.100.0.2

/ip route
add dst-address=192.168.88.0/24 gateway=10.100.0.2

# Configuración Site "B"
/interface l2tp-client
add name=l2tp-ipsec connect-to=“IP Publica o DDNS” user=l2tplab
    password=l2tplab use-ipsec=yes ipsec-secret=ipseclab allow=mschap2
    disabled=no

/ip route
add dst_address=192.168.88.0/24 gateway=10.100.0.1