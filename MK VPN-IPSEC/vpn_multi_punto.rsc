# Configuración de un punto central y sucursales para una VPN PPTP
#
/ip address add address=10.0.0.1/24 interface=ether1
/ip address add address=192.168.1.1/24 interface=ether2
/ip pool add name=vpn-pool ranges=10.0.0.10-10.0.0.250
/ppp profile add name=vpn-profile local-address=10.0.0.1 remote-address=vpn-pool
/ppp secret add name=sucursal1 password=contraseña1 profile=vpn-profile remote-address=192.168.1.2
/ppp secret add name=sucursal2 password=contraseña2 profile=vpn-profile remote-address=192.168.1.3
/ppp secret add name=sucursal3 password=contraseña3 profile=vpn-profile remote-address=192.168.1.4
/interface pptp-server server set enabled=yes

# En cada una de las sucursales, agregar en la configuración:

/interface pptp-client add connect-to=IP_del_centro user=sucursal1 password=contraseña1

# Reemplazando "sucursal1" y "contraseña1" con las credenciales correspondientes a cada sucursal y 
# "IP_del_centro" con la dirección IP del punto central.

# Nota: Es importante tener en cuenta que esta configuración es solo un ejemplo básico y 
# puede requerir ajustes adicionales para adaptarse a las necesidades específicas de la red.
