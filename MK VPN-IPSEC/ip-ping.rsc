/interface ovpn-server server set default-profile=default
/interface ovpn-server server set enabled=yes
/interface ovpn-server server set port=1194
/interface ovpn-server server set auth=sha1
/interface ovpn-server server set encrypt=aes256
/interface ovpn-server server set certificate=server

/ip firewall filter add chain=input protocol=tcp dst-port=1194 action=accept

/interface ovpn-server server add name=VPN1 user=VPN1 password=contraseña
/interface ovpn-server server peer add name=VPN1 address=IP_REMOTA

/interface ovpn-server server add name=VPN2 user=VPN2 password=contraseña
/interface ovpn-server server peer add name=VPN2 address=IP_REMOTA

/ip route add gateway=VPN1 distance=1
/ip route add gateway=VPN2 distance=1

/ip firewall nat add chain=srcnat out-interface=VPN1 action=masquerade
/ip firewall nat add chain=srcnat out-interface=VPN2 action=masquerade

/ip firewall filter add chain=input protocol=tcp dst-port=1194 action=accept

/interface ovpn-server server set default-profile=default
/interface ovpn-server server set enabled=yes
/interface ovpn-server server set port=1194
/interface ovpn-server server set auth=sha1
/interface ovpn-server server set encrypt=aes256
/interface ovpn-server server set certificate=server

/ip firewall filter add chain=input protocol=tcp dst-port=1194 action=accept

/interface ovpn-server server add name=VPN1 user=VPN1 password=contraseña
/interface ovpn-server server peer add name=VPN1 address=IP_REMOTA

/interface ovpn-server server add name=VPN2 user=VPN2 password=contraseña
/interface ovpn-server server peer add name=VPN2 address=IP_REMOTA

/ip route add gateway=VPN1 distance=1
/ip route add gateway=VPN2 distance=1

/ip firewall nat add chain=srcnat out-interface=VPN1 action=masquerade
/ip firewall nat add chain=srcnat out-interface=VPN2 action=masquerade

# Nota: Es importante cambiar las variables como contraseñas, IP_REMOTA, 
# los nombres de las conexiones y los certificados.

# Para generar los certificados, se debe ejecutar el siguiente comando:
# /certificate print
