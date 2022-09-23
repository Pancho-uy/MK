/ip service
set winbox address=192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,10.0.0.0/8,172.21.0.48/28
set ssh port=3322 address=192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,10.0.0.0/8,172.21.0.48/28
set api-ssl disabled=yes
set www disabled=yes
set ftp disabled=yes
set telnet disabled=yes
set api disabled=yes    
set www-ssl disabled=yes

/system clock set time-zone-name=America/Argentina/Buenos_Aires
/system ntp client
set enabled=yes primary-ntp=164.73.232.34 secondary-ntp=190.64.134.53

/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk

/ip dns
set allow-remote-requests=yes cache-max-ttl=6h servers=200.108.192.4,200.108.192.5

/system identity
set name="1002075_FIDEICOMISO 1243/2017 TRESOR - MK3"

/user add name=tecnico password=EelcI.dlMdD group=full

/user remove admin
/system package
update install

/system routerboard print
/system routerboard
upgrade
y