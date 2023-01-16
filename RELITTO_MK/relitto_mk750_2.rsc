# jan/16/2023 15:52:22 by RouterOS 6.49.2
# software id = 3MGG-X11W
#
# model = RB750r2
# serial number = AA840BEDA7CD
/interface bridge
add name=bridgeLAN vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] comment="MK PRINCIPAL 10.69.20.110/24" name=\
    "ether1 - Uplink"
set [ find default-name=ether2 ] name="ether2 - CAMARAS"
set [ find default-name=ether3 ] name=\
    "ether3 - MESH en Mastil para Habitaciones 400"
set [ find default-name=ether4 ] name="ether4 - UniFi Restaurante"
set [ find default-name=ether5 ] name="ether5 - UniFi Barbacoa"
/interface vlan
add interface="ether1 - Uplink" name=vlan20 vlan-id=20
add interface="ether1 - Uplink" name=vlan500 vlan-id=500
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/interface bridge port
add bridge=bridgeLAN interface=vlan500
add bridge=bridgeLAN hw=no interface="ether2 - CAMARAS"
add bridge=bridgeLAN hw=no interface=\
    "ether3 - MESH en Mastil para Habitaciones 400"
add bridge=bridgeLAN hw=no interface="ether4 - UniFi Restaurante"
add bridge=bridgeLAN hw=no interface="ether5 - UniFi Barbacoa"
/ip neighbor discovery-settings
set discover-interface-list=all
/ip address
add address=10.69.20.109/24 interface=vlan20 network=10.69.20.0
add address=192.168.88.2/24 interface=vlan500 network=192.168.88.0
/ip dns
set allow-remote-requests=yes servers=200.108.192.4,200.108.192.5
/ip route
add distance=1 gateway=192.168.88.1
add distance=1 dst-address=10.0.0.0/8 gateway=10.69.20.1
add distance=1 dst-address=172.21.0.48/28 gateway=10.69.20.1
/system clock
set time-zone-name=America/Montevideo
/system identity
set name="1009248 RELITO S.A. 750_2"
/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk