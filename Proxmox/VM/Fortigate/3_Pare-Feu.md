------------------------------------------------------------------------
# <p align='center'> Configuration du Pare-feu </p>
------------------------------------------------------------------------
## I. Base
### A. Règle de base implicite
La règle de base bloque tout le trafic.

<img width="2027" height="96" alt="image" src="https://github.com/user-attachments/assets/c15c31f3-bbde-41cf-b13a-41c5b35d287a" />


### B. Suppression de règle
```bash
config firewall policy
    delete 1
    delete 2
    delete 3
    delete 4
    delete 99
end
```

### C. Création de règle (Web, Ping)
```bash
config firewall policy
    edit 1
        set name "LAN_to_WAN_WEB"
        set srcintf "port2"
        set dstintf "port1"
        set srcaddr "port2 address"
        set dstaddr "all"
        set action accept
        set schedule "always"
        set service "DNS" "HTTP" "HTTPS" 
        set nat enable
end
```

```bash
config firewall policy
    edit 2
        set name "LAN_to_WAN_PING"
        set srcintf "port2"
        set dstintf "port1"
        set srcaddr "port2 address"
        set dstaddr "all"
        set action accept
        set schedule "always"
        set service "PING" "TRACEROUTE"
        set nat enable
end
```


```bash
config firewall policy
    edit 3
        set name "LAN_to_WAN_SAMBA"
        set srcintf "port2"
        set dstintf "port1"
        set srcaddr "port2 address"
        set dstaddr "all"
        set action accept
        set schedule "always"
        set service "SMB" "SAMBA"
        set nat enable
end
```

```bash
config firewall policy
    edit 4
        set name "LAN_to_WAN_RDP"
        set srcintf "port2"
        set dstintf "port1"
        set srcaddr "port2 address"
        set dstaddr "all"
        set action accept
        set schedule "always"
        set service "SMB" "SAMBA"
        set nat enable
end
```


### D. Full Trafic autorisé
```
config firewall policy
    edit 99
        set name "LAN_to_WAN"
        set srcintf "port2"
        set dstintf "port1"
        set srcaddr "port2 address"
        set dstaddr "all"
        set action accept
        set schedule "always"
        set service "ALL"
        set nat disable
    next
end
```


