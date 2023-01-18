#Configuración del Site "B"
# SUSTITUIR IP_PUBLICA POR LA IP PUBLICA DEL ROUTER
/ip ipsec peer
add address=IP_PUBLICA secret=“ipsec-pass” port=500 
auth-method=pre-shared-key

/ip ipsec proposal
add name="ipsec" auth-algorithms=sha1 enc-algorithms=3des lifetime=30m pfs-group=modp1024

/ip ipsec policy
add proposal="ipsec" src-address=192.168.2.0/24 
dst-address=192.168.1.0/24 sa-src-address=34.195.171.188 
sa-dst-address=107.161.185.30 tunnel=yes

/ip firewall nat
add action=accept chain=srcnat src-address=192.168.2.0/24 
dst-address=192.168.1.0/24 place-before=0
