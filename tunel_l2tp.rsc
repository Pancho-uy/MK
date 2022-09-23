# Script para L2TP/IPsec VPN

/ip firewall filter add action=accept chain=input dst-port=1701,500,4500 protocol=udp
/ip firewall filter add action=accept chain=input protocol=ipsec-esp
/ip pool add name=poolL2TP ranges=192.168.250.0/29
/interface l2tp-server server set authentication=mschap2 default-profile=vpn enabled=yes use-ipsec=required ipsec-secret=ipsecLUNARSA
/ppp profile add bridge-learning=yes local-address=192.168.250.1 name=vpn remote-address=poolL2TP use-compression=no use-encryption=yes use-mpls=no
/ppp secret add name=lunarsa1 profile=vpn service=l2tp password=l2tplunarsa
/ppp secret add name=lunarsa2 profile=vpn service=l2tp password=l2tplunarsa

