# COPIA Y PEGA EN TU CONSOLA DESPUES DE ESTA LINEA
/ip hotspot user profile
add keepalive-timeout=1d mac-cookie-timeout=1d name=Ficha_1Dia on-login="{\r\
    \n\r\
    \n:local tdias 1\r\
    \n:local atime [ /system clock get time ]\r\
    \n\r\
    \n:local adate [ /system clock get date ]\r\
    \n\r\
    \n:local temp1 [:pick \$adate 0 3] \r\
    \n\r\
    \n:local temp2 [:pick \$adate 4 6]\r\
    \n\r\
    \n:local temp3 [:pick \$atime 0 5]\r\
    \n\r\
    \n:local temp4 (\$temp2.\"/\".\$temp1.\" - \".\$temp3.\"  Dias: \".\$tdias\
    \_);\r\
    \n\r\
    \n:if ([ /ip hotspot user get \$user comment ]=\"\") do={ [ /ip hotspot us\
    er set \$user comment=\$temp4 ] }\r\
    \n\r\
    \n# Agrego un registro en el LOG del usuario\r\
    \n /log info \"Usuario= \$user \$adate \$atime Dias: \$tdias \";\r\
    \n\r\
    \n\r\
    \n\r\
    \n:local mesarray (\"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\",\"jul\"\
    ,\"aug\",\"sep\",\"oct\",\"nov\",\"dec\")\r\
    \n\r\
    \n:local diaarray (\"31\",\"28\",\"31\",\"30\",\"31\",\"30\",\"31\",\"31\"\
    ,\"30\",\"31\",\"30\",\"31\")\r\
    \n\r\
    \n:local day [:pick \$adate 4 6]\r\
    \n\r\
    \n:local monthtxt [:pick \$adate 0 3]\r\
    \n\r\
    \n:local year [:pick \$adate 7 11]\r\
    \n\r\
    \n:local months ([:find \$mesarray \$monthtxt])\r\
    \n\r\
    \n:local dia ([:pick \$diaarray \$months])\r\
    \n\r\
    \n :if ((\$day+\$tdias)>\$dia) do={\r\
    \n    :if (\$months=11) do={\r\
    \n        \r\
    \n     :set months 0\r\
    \n        \r\
    \n     :set year (\$year+1)\r\
    \n        \r\
    \n     :set day ((\$day+\$tdias)-\$dia)\r\
    \n        \r\
    \n     :local mes ([:pick \$mesarray \$months])\r\
    \n        \r\
    \n     :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n        \r\
    \n     } else={\r\
    \n           \r\
    \n       :set months (\$months+1)\r\
    \n           \r\
    \n       :set day ((\$day+\$tdias)-\$dia)\r\
    \n           \r\
    \n       :local mes ([:pick \$mesarray \$months])\r\
    \n           \r\
    \n       :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n        \r\
    \n       }\r\
    \n    \r\
    \n        } else={\r\
    \n        \r\
    \n          :set day (\$day+\$tdias)\r\
    \n        \r\
    \n          :local mes ([:pick \$mesarray \$months])\r\
    \n        \r\
    \n          :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n    \r\
    \n     }\r\
    \n\r\
    \n\r\
    \n[/system scheduler add name=\$user on-event=\"/ip hotspot user remove \\\
    \"\$user\\\"\\r\\\r\
    \n   \r\
    \n  \\n/ip hotspot active remove \\\"\$user\\\"\\r\\\r\
    \n  \r\
    \n  \\n/system scheduler remove \\\"\$user\\\"\\r\\\r\
    \n   \r\
    \n  \\n/\\r\\\r\
    \n\" start-date=\$adate start-time=\$atime]\r\
    \n\r\
    \n}  " rate-limit=256k/1M transparent-proxy=yes
add keepalive-timeout=1h mac-cookie-timeout=1h name=Ficha_1Hora on-login="{\r\
    \n:local tdias 0\r\
    \n:local atime [ /system clock get time ]\r\
    \n:local adate [ /system clock get date ]\r\
    \n:local temp1 [:pick \$adate 0 3] \r\
    \n:local temp2 [:pick \$adate 4 6]\r\
    \n:local temp3 [:pick \$atime 0 5]\r\
    \n:local temp4 (\$temp2.\"/\".\$temp1.\" - \".\$temp3.\"  Dias: \".\$tdias\
    );\r\
    \n:local thoras 1\r\
    \n:if ([ /ip hotspot user get \$user comment ]=\"\") do={ [ /ip hotspot us\
    er set \$user comment=\$temp4 ] }\r\
    \n\r\
    \n# Agrego un registro en el LOG del usuario\r\
    \n\r\
    \n:local mesarray (\"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\",\"jul\"\
    ,\"aug\",\"sep\",\"oct\",\"nov\",\"dec\")\r\
    \n:local diaarray (\"31\",\"28\",\"31\",\"30\",\"31\",\"30\",\"31\",\"31\"\
    ,\"30\",\"31\",\"30\",\"31\")\r\
    \n:local day [:pick \$adate 4 6]\r\
    \n:local monthtxt [:pick \$adate 0 3]\r\
    \n:local year [:pick \$adate 7 11]\r\
    \n:local months ([:find \$mesarray \$monthtxt])\r\
    \n:local dia ([:pick \$diaarray \$months])\r\
    \n:local fhora [:pick \$atime 0 2]\r\
    \n:local fminutos [:pick \$atime 3 5]\r\
    \n:local fsegundos [:pick \$atime 6 9]\r\
    \n:local mayorhora ((\$fhora+\$thoras)-24) \r\
    \n\r\
    \n :if ((\$fhora+\$thoras)>23) do={\r\
    \n     :set atime (\"0\".\$mayorhora.\":\".\$fminutos.\":\".fsegundos);\r\
    \n\t :set \$tdias (\$tdias+1);\r\
    \n\t} else={\r\
    \n     :set atime ((\$fhora+\$thoras).\":\".\$fminutos.\":\".fsegundos) ;\
    \r\
    \n }\r\
    \n \r\
    \n\r\
    \n :if ((\$day+\$tdias)>\$dia) do={\r\
    \n    :if (\$months=11) do={\r\
    \n        \r\
    \n     :set months 0;\r\
    \n        \r\
    \n     :set year (\$year+1);\r\
    \n        \r\
    \n     :set day ((\$day+\$tdias)-\$dia);\r\
    \n        \r\
    \n     :local mes ([:pick \$mesarray \$months]);\r\
    \n        \r\
    \n     :set adate (\$mes.\"/\".\$day.\"/\".\$year);\r\
    \n        \r\
    \n     } else={\r\
    \n           \r\
    \n       :set months (\$months+1);\r\
    \n           \r\
    \n       :set day ((\$day+\$tdias)-\$dia);\r\
    \n           \r\
    \n       :local mes ([:pick \$mesarray \$months]);\r\
    \n           \r\
    \n       :set adate (\$mes.\"/\".\$day.\"/\".\$year);\r\
    \n        \r\
    \n       }\r\
    \n    \r\
    \n        } else={\r\
    \n        \r\
    \n          :set day (\$day+\$tdias);\r\
    \n        \r\
    \n          :local mes ([:pick \$mesarray \$months]);\r\
    \n        \r\
    \n          :set adate (\$mes.\"/\".\$day.\"/\".\$year);\r\
    \n    \r\
    \n     }\r\
    \n\r\
    \n[/system scheduler add name=\$user on-event=\"/ip hotspot user remove \\\
    \"\$user\\\" \\r\\\r\
    \n  \\n/system scheduler remove [find name=\\\"\$user\\\"] \\r\\\r\
    \n  \\n/ip hotspot active remove [find user=\\\"\$user\\\"] \\r\\\r\
    \n  \\n/\\r\\\r\
    \n\" start-date=\$adate start-time=\$atime]\r\
    \n \r\
    \n}  \r\
    \n" rate-limit=256k/1M transparent-proxy=yes
add keepalive-timeout=1w mac-cookie-timeout=1w name=Ficha_7Dias on-login="{\r\
    \n\r\
    \n:local tdias 7\r\
    \n:local atime [ /system clock get time ]\r\
    \n\r\
    \n:local adate [ /system clock get date ]\r\
    \n\r\
    \n:local temp1 [:pick \$adate 0 3] \r\
    \n\r\
    \n:local temp2 [:pick \$adate 4 6]\r\
    \n\r\
    \n:local temp3 [:pick \$atime 0 5]\r\
    \n\r\
    \n:local temp4 (\$temp2.\"/\".\$temp1.\" - \".\$temp3.\"  Dias: \".\$tdias\
    );\r\
    \n\r\
    \n:if ([ /ip hotspot user get \$user comment ]=\"\") do={ [ /ip hotspot us\
    er set \$user comment=\$temp4 ] }\r\
    \n\r\
    \n# Agrego un registro en el LOG del usuario\r\
    \n /log info \"Usuario= \$user \$adate \$atime Dias: \$tdias \";\r\
    \n\r\
    \n\r\
    \n\r\
    \n:local mesarray (\"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\",\"jul\"\
    ,\"aug\",\"sep\",\"oct\",\"nov\",\"dec\")\r\
    \n\r\
    \n:local diaarray (\"31\",\"28\",\"31\",\"30\",\"31\",\"30\",\"31\",\"31\"\
    ,\"30\",\"31\",\"30\",\"31\")\r\
    \n\r\
    \n:local day [:pick \$adate 4 6]\r\
    \n\r\
    \n:local monthtxt [:pick \$adate 0 3]\r\
    \n\r\
    \n:local year [:pick \$adate 7 11]\r\
    \n\r\
    \n:local months ([:find \$mesarray \$monthtxt])\r\
    \n\r\
    \n:local dia ([:pick \$diaarray \$months])\r\
    \n\r\
    \n :if ((\$day+\$tdias)>\$dia) do={\r\
    \n    :if (\$months=11) do={\r\
    \n        \r\
    \n     :set months 0\r\
    \n        \r\
    \n     :set year (\$year+1)\r\
    \n        \r\
    \n     :set day ((\$day+\$tdias)-\$dia)\r\
    \n        \r\
    \n     :local mes ([:pick \$mesarray \$months])\r\
    \n        \r\
    \n     :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n        \r\
    \n     } else={\r\
    \n           \r\
    \n       :set months (\$months+1)\r\
    \n           \r\
    \n       :set day ((\$day+\$tdias)-\$dia)\r\
    \n           \r\
    \n       :local mes ([:pick \$mesarray \$months])\r\
    \n           \r\
    \n       :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n        \r\
    \n       }\r\
    \n    \r\
    \n        } else={\r\
    \n        \r\
    \n          :set day (\$day+\$tdias)\r\
    \n        \r\
    \n          :local mes ([:pick \$mesarray \$months])\r\
    \n        \r\
    \n          :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n    \r\
    \n     }\r\
    \n\r\
    \n\r\
    \n[/system scheduler add name=\$user on-event=\"/ip hotspot user remove \\\
    \"\$user\\\"\\r\\\r\
    \n   \r\
    \n  \\n/ip hotspot active remove \\\"\$user\\\"\\r\\\r\
    \n  \r\
    \n  \\n/system scheduler remove \\\"\$user\\\"\\r\\\r\
    \n   \r\
    \n  \\n/\\r\\\r\
    \n\" start-date=\$adate start-time=\$atime]\r\
    \n\r\
    \n}  " rate-limit=256k/1M transparent-proxy=yes
add keepalive-timeout=2w1d mac-cookie-timeout=2w1d name=Ficha_15Dias \
    on-login="{\r\
    \n\r\
    \n:local tdias 15\r\
    \n:local atime [ /system clock get time ]\r\
    \n\r\
    \n:local adate [ /system clock get date ]\r\
    \n\r\
    \n:local temp1 [:pick \$adate 0 3] \r\
    \n\r\
    \n:local temp2 [:pick \$adate 4 6]\r\
    \n\r\
    \n:local temp3 [:pick \$atime 0 5]\r\
    \n\r\
    \n:local temp4 (\$temp2.\"/\".\$temp1.\" - \".\$temp3.\"  Dias: \".\$tdias\
    );\r\
    \n\r\
    \n:if ([ /ip hotspot user get \$user comment ]=\"\") do={ [ /ip hotspot us\
    er set \$user comment=\$temp4 ] }\r\
    \n\r\
    \n# Agrego un registro en el LOG del usuario\r\
    \n /log info \"Usuario= \$user \$adate \$atime Dias: \$tdias \";\r\
    \n\r\
    \n\r\
    \n\r\
    \n:local mesarray (\"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\",\"jul\"\
    ,\"aug\",\"sep\",\"oct\",\"nov\",\"dec\")\r\
    \n\r\
    \n:local diaarray (\"31\",\"28\",\"31\",\"30\",\"31\",\"30\",\"31\",\"31\"\
    ,\"30\",\"31\",\"30\",\"31\")\r\
    \n\r\
    \n:local day [:pick \$adate 4 6]\r\
    \n\r\
    \n:local monthtxt [:pick \$adate 0 3]\r\
    \n\r\
    \n:local year [:pick \$adate 7 11]\r\
    \n\r\
    \n:local months ([:find \$mesarray \$monthtxt])\r\
    \n\r\
    \n:local dia ([:pick \$diaarray \$months])\r\
    \n\r\
    \n :if ((\$day+\$tdias)>\$dia) do={\r\
    \n    :if (\$months=11) do={\r\
    \n        \r\
    \n     :set months 0\r\
    \n        \r\
    \n     :set year (\$year+1)\r\
    \n        \r\
    \n     :set day ((\$day+\$tdias)-\$dia)\r\
    \n        \r\
    \n     :local mes ([:pick \$mesarray \$months])\r\
    \n        \r\
    \n     :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n        \r\
    \n     } else={\r\
    \n           \r\
    \n       :set months (\$months+1)\r\
    \n           \r\
    \n       :set day ((\$day+\$tdias)-\$dia)\r\
    \n           \r\
    \n       :local mes ([:pick \$mesarray \$months])\r\
    \n           \r\
    \n       :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n        \r\
    \n       }\r\
    \n    \r\
    \n        } else={\r\
    \n        \r\
    \n          :set day (\$day+\$tdias)\r\
    \n        \r\
    \n          :local mes ([:pick \$mesarray \$months])\r\
    \n        \r\
    \n          :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n    \r\
    \n     }\r\
    \n\r\
    \n\r\
    \n[/system scheduler add name=\$user on-event=\"/ip hotspot user remove \\\
    \"\$user\\\"\\r\\\r\
    \n   \r\
    \n  \\n/ip hotspot active remove \\\"\$user\\\"\\r\\\r\
    \n  \r\
    \n  \\n/system scheduler remove \\\"\$user\\\"\\r\\\r\
    \n   \r\
    \n  \\n/\\r\\\r\
    \n\" start-date=\$adate start-time=\$atime]\r\
    \n\r\
    \n}  " rate-limit=256k/1M transparent-proxy=yes
add keepalive-timeout=4w2d mac-cookie-timeout=4w2d name=Ficha_30Dias \
    on-login="{\r\
    \n\r\
    \n:local tdias 30\r\
    \n:local atime [ /system clock get time ]\r\
    \n\r\
    \n:local adate [ /system clock get date ]\r\
    \n\r\
    \n:local temp1 [:pick \$adate 0 3] \r\
    \n\r\
    \n:local temp2 [:pick \$adate 4 6]\r\
    \n\r\
    \n:local temp3 [:pick \$atime 0 5]\r\
    \n\r\
    \n:local temp4 (\$temp2.\"/\".\$temp1.\" - \".\$temp3.\"  Dias: \".\$tdias\
    );\r\
    \n\r\
    \n:if ([ /ip hotspot user get \$user comment ]=\"\") do={ [ /ip hotspot us\
    er set \$user comment=\$temp4 ] }\r\
    \n\r\
    \n# Agrego un registro en el LOG del usuario\r\
    \n /log info \"Usuario= \$user \$adate \$atime Dias: \$tdias \";\r\
    \n\r\
    \n\r\
    \n\r\
    \n:local mesarray (\"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\",\"jul\"\
    ,\"aug\",\"sep\",\"oct\",\"nov\",\"dec\")\r\
    \n\r\
    \n:local diaarray (\"31\",\"28\",\"31\",\"30\",\"31\",\"30\",\"31\",\"31\"\
    ,\"30\",\"31\",\"30\",\"31\")\r\
    \n\r\
    \n:local day [:pick \$adate 4 6]\r\
    \n\r\
    \n:local monthtxt [:pick \$adate 0 3]\r\
    \n\r\
    \n:local year [:pick \$adate 7 11]\r\
    \n\r\
    \n:local months ([:find \$mesarray \$monthtxt])\r\
    \n\r\
    \n:local dia ([:pick \$diaarray \$months])\r\
    \n\r\
    \n :if ((\$day+\$tdias)>\$dia) do={\r\
    \n    :if (\$months=11) do={\r\
    \n        \r\
    \n     :set months 0\r\
    \n        \r\
    \n     :set year (\$year+1)\r\
    \n        \r\
    \n     :set day ((\$day+\$tdias)-\$dia)\r\
    \n        \r\
    \n     :local mes ([:pick \$mesarray \$months])\r\
    \n        \r\
    \n     :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n        \r\
    \n     } else={\r\
    \n           \r\
    \n       :set months (\$months+1)\r\
    \n           \r\
    \n       :set day ((\$day+\$tdias)-\$dia)\r\
    \n           \r\
    \n       :local mes ([:pick \$mesarray \$months])\r\
    \n           \r\
    \n       :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n        \r\
    \n       }\r\
    \n    \r\
    \n        } else={\r\
    \n        \r\
    \n          :set day (\$day+\$tdias)\r\
    \n        \r\
    \n          :local mes ([:pick \$mesarray \$months])\r\
    \n        \r\
    \n          :set adate (\$mes.\"/\".\$day.\"/\".\$year)\r\
    \n    \r\
    \n     }\r\
    \n\r\
    \n\r\
    \n[/system scheduler add name=\$user on-event=\"/ip hotspot user remove \\\
    \"\$user\\\"\\r\\\r\
    \n   \r\
    \n  \\n/ip hotspot active remove \\\"\$user\\\"\\r\\\r\
    \n  \r\
    \n  \\n/system scheduler remove \\\"\$user\\\"\\r\\\r\
    \n   \r\
    \n  \\n/\\r\\\r\
    \n\" start-date=\$adate start-time=\$atime]\r\
    \n\r\
    \n}  " rate-limit=256k/1M transparent-proxy=yes
/ip hotspot user

