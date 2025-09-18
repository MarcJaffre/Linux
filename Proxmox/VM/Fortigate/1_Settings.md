-----------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration de base du routeur </p>
-----------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------------
## I. Configuration
### A. Reset Factory
```bash
execute factoryreset
```

### B. Premier démarrage
Lors du premier démarrage, indiquer comme identifiant `admin` et comme mot de passe `vide`.

```

config system interface

# Configuration WAN
edit "port1"
    set mode static
    set ip 192.168.0.44 255.255.255.0
    set name WAN
    set alias "WAN"
    set role wan
    set allowaccess ping ssh http https
next

# Configuration LAN
edit "port2"
    set mode static
    set ip 192.168.10.1 255.255.255.0
    set name LAN
    set alias "LAN"
    set role lan
    set allowaccess ping ssh http https
end

# Configuration de la passerelle
config router static
edit 1
    set gateway 192.168.0.1
    set device "port1"
next
end

# Configuration du DNS
config system dns
    set primary 8.8.8.8
    set secondary 8.8.4.4
end

# Configuration du DHCP
config system dhcp server
    edit 1
        set interface "port2"
        set lease-time 86400
        set netmask 255.255.255.0
        config ip-range
            edit 1
                set start-ip 192.168.10.2
                set end-ip 192.168.10.10
            next
        end
        set default-gateway 192.168.10.1
        set dns-server1 8.8.8.8
        set dns-server2 8.8.4.4
        set status enable
    next
end

# Configuration globale
config system global
    set hostname fortigate
    set language french
    set timezone Europe/Paris
end

execute ping google.fr
```




```
https://docs.fortinet.com/document/fortigate-private-cloud/7.6.0/openstack-administration-guide/740208/deploying-a-fortigate-vm-instance-in-an-openstack-environment
```





## I. Configuration de base
### A. Settings (Hostname, NTP, Langue)
Dans le bandeau de gauche, sélectionner le menu `Settings`.

```
Host name : Fortigate
Time zone : (UTC+1:00) Europe/Paris
Setup device as local NTP server : OFF

HTTP port  : 80
HTTPS port : 443
SSH port   : 22

Language : French
```

<br />
