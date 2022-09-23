Mikrotik bloquear actualizaciones automaticas de Windows (8 - 10) con Layer 7 Protocols
Mikrotik bloquear actualizaciones autom�ticas de Windows (8 - 10) con Layer 7 Protocols

Aqu� un ejemplo de como bloquear las actualizaciones autom�ticas que por defecto hace el S.O. Windows en segundo plano. y  sin tu permiso ralentiza a la maquina  y la navegaci�n por Internet.

1.-Agregamos el siguiente regex en Layer 7

/ip firewall layer7-protocol
add name=block-update-ms regexp=".(stats|ntservicepack|update|download|windowsup\
    date|v4.windowsupdate).(microsoft|windowsupdate)"
add name=block-update-msw regexp=".(wustat|ws|v4.windowsupdate.microsoft|windows\
    update.microsoft).(nsatc|windows|microsoft)"

2.- En IP Firewall Filter Rules denegamos el trafico de entrada y salida  las actualizaciones autom�ticas:

/ip firewall filter
add action=drop chain=forward comment=Block-Update-Windows layer7-protocol=\
    block-update-ms
add action=drop chain=forward layer7-protocol=block-update-msw