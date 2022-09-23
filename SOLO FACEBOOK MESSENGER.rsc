
#Hotspot BASICO
    #-Server y profile "Segun su Topología" 
    #-Funciona mejor con MAC cookie
#Definir Servidor Ntp
#Definir Zona Horaria  (Ciudad segun sea su caso)
#Agregar Adres list (debajo)
#Agregar Firewall Filter (debajo)
#Crear perfil  y seleccionar en Addres list "O_Cliente"
    #-Si usa perfiles para tiempo corrido  (Agregar)
    #-Segun los  tiempos que desee
#Crear usuario y asignarle el perfil creado anteriormente
#Asignarle un Up-Time al mismo usuario Aplicar y aceptar
# Copiar Y Pegar

#######Copiar desde aqui######
/ip firewall address-list
add address=31.13.69.0/24 list=facebook
add address=31.13.70.0/24 list=facebook
add address=31.13.71.0/24 list=facebook
add address=31.13.73.0/24 list=facebook
add address=31.13.74.0/24 list=facebook
add address=31.13.75.0/24 list=facebook
add address=31.13.76.0/24 list=facebook
add address=157.240.3.15 list=O
add address=157.240.3.32 list=O
add address=157.240.14.32 list=O
add address=157.240.14.36 list=O
add address=157.240.14.15 list=O
add address=157.240.14.10 list=O
add address=31.13.24.0/21 list=O
add address=31.13.64.0/18 list=O
add address=31.13.64.0/19 list=O
add address=31.13.64.0/24 list=O
add address=31.13.65.0/24 list=O
add address=31.13.66.0/24 list=O
add address=31.13.68.0/24 list=O
add address=31.13.69.0/24 list=O
add address=31.13.70.0/24 list=O
add address=31.13.71.0/24 list=O
add address=31.13.73.0/24 list=O
add address=31.13.74.0/24 list=O
add address=31.13.75.0/24 list=O
add address=31.13.76.0/24 list=O
add address=31.13.77.0/24 list=O
add address=31.13.78.0/24 list=O
add address=31.13.79.0/24 list=O
add address=31.13.82.0/24 list=O
add address=31.13.64.0/24 list=facebook
add address=31.13.65.0/24 list=facebook
add address=31.13.66.0/24 list=facebook
add address=31.13.68.0/24 list=facebook
add address=31.13.83.0/24 list=O
add address=31.13.84.0/24 list=O
add address=31.13.85.0/24 list=O
add address=31.13.86.0/24 list=O
add address=31.13.87.0/24 list=O
add address=31.13.90.0/24 list=O
add address=31.13.91.0/24 list=O
add address=31.13.93.0/24 list=O
add address=31.13.95.0/24 list=O
add address=31.13.96.0/19 list=O
add address=66.220.144.0/20 list=O
add address=66.220.144.0/21 list=O
add address=66.220.152.0/21 list=O
add address=69.63.176.0/20 list=O
add address=69.63.176.0/21 list=O
add address=69.63.184.0/21 list=O
add address=69.171.224.0/19 list=O
add address=69.171.224.0/20 list=O
add address=69.171.239.0/24 list=O
add address=69.171.240.0/20 list=O
add address=69.171.255.0/24 list=O
add address=74.119.76.0/22 list=O
add address=103.4.96.0/22 list=O
add address=173.252.64.0/19 list=O
add address=173.252.96.0/19 list=O
add address=179.60.192.0/22 list=O
add address=179.60.192.0/24 list=O
add address=179.60.193.0/24 list=O
add address=31.13.24.0/21 list=facebook
add address=31.13.64.0/18 list=facebook
add address=31.13.64.0/19 list=facebook

/ip firewall filter
add action=drop chain=forward comment="Shield" disabled=no src-address-list=Addr-List-HotspotShield
add chain=forward comment=demo dst-address-list=O src-address-list=O_client
add chain=forward comment=demo dst-address-list=O_client src-address-list=O
add chain=input comment=demo dst-address-list=O src-address-list=O_client
add chain=input comment=demo dst-address-list=O_client src-address-list=O
add chain=output comment=demo dst-address-list=O src-address-list=O_client
add chain=output comment=demo dst-address-list=O_client src-address-list=O
add action=reject chain=forward comment=demo src-address-list=O_client
add action=reject chain=forward comment=demo dst-address-list=O_client
add action=reject chain=input comment=demo src-address-list=O_client
add action=reject chain=input comment=demo dst-address-list=O_client
add chain=output comment=demo dst-address-list=O_client protocol=tcp src-port=80
add chain=output comment=demo dst-address-list=O_client protocol=tcp src-port=64872-64875
add chain=output comment=demo dst-address-list=O_client protocol=udp src-port=53
add chain=output comment=demo dst-address-list=O_client protocol=udp src-port=64872
add action=reject chain=output comment=demo src-address-list=O_client
add action=reject chain=output comment=demo dst-address-list=O_client
add action=add-src-to-address-list address-list=bit-list address-list-timeout=1m chain=forward disabled=yes dst-address-list=\
    !bit-unblock-list layer7-protocol=layer7-bittorrent-exp src-address-list=\
    !bit-unblock-list src-address-type=local
add action=drop chain=forward disabled=no dst-port=!80,443 protocol=tcp src-address-list=bit-list
add action=drop chain=forward disabled=no protocol=udp src-address-list=bit-list

/ip firewall layer7-protocol
add name=Face regexp="^.+(facebook.com).*\$"