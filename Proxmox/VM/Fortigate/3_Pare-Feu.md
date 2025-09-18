------------------------------------------------------------------------
# <p align='center'> Configuration du Pare-feu </p>
------------------------------------------------------------------------
## I. Base
### A. Règle de base implicite
La règle de base bloque tout le trafic.

<img width="2027" height="96" alt="image" src="https://github.com/user-attachments/assets/c15c31f3-bbde-41cf-b13a-41c5b35d287a" />


### B. Création de règle

```bash
config firewall policy
    delete 0
end

config firewall policy
    edit 0
        set name "LAN_to_WAN"
        set srcintf "port2"
        set dstintf "port1"
        set srcaddr "all"
        set dstaddr "all"
        set action accept
        set schedule "always"
        set service "ALL"
        set nat enable
    next
end
```


