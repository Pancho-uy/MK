____________________________________________________________________________

SCRIPT PARA EVITAR QUE COMPARTAN EL INTERNET MEDIANTE BLUETOOTH MODIFICAR X.X.X POR TU RANGO DE IP

____________________________________________________________________________


	/ip firewall mangle
    add action=change-ttl chain=postrouting comment="BLOQUEO DE BLUETOOTH" \
    dst-address=192.168.15.0/24 new-ttl=set:1


___________________________________________________________________________






