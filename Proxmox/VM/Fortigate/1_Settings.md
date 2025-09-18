-----------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration de base du routeur </p>
-----------------------------------------------------------------------------------------------------------------------
## I. Configuration du routeur en CLI
### A. Console SSH
Se connecter en SSH et injecter la configuration

### B. Configuration Global
```bash
config system global
    set hostname fortigate
    set language french
    set timezone Europe/Paris
end
```
### C. Définir un alias et la zone du WAN
```
config system interface
edit "port1"
    set alias "WAN"
    set role wan
end
```

### D. Configuration de la passerelle
```bash
config router static
edit 1
    set dst 0.0.0.0/0
    set gateway 192.168.0.1
    set device "port1"
end
```

### E. Configuration du DNS (routeur)
```bash
config system dns
    set primary 8.8.8.8
    set secondary 8.8.4.4
end
```


### F. Configuration du LAN
```bash
config system interface
edit "port2"
    set mode static
    set ip 192.168.10.1/24
    set name LAN
    set alias "LAN"
    set role lan
    set allowaccess ping ssh http https
end
```

### G. Configuration du DHCP (KO)
```bash
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
        set dns-service specify
        set dns-server1 8.8.8.8
        set dns-server2 8.8.4.4
        set status enable
end
```


Valeur relevé depuis un DHCP crée depuis le panel web:
```
config system dhcp server
get 1
id                  : 1
status              : enable
lease-time          : 604800
mac-acl-default-action: assign
forticlient-on-net-status: enable
dns-service         : default
wifi-ac-service     : specify
wifi-ac1            : 0.0.0.0
wifi-ac2            : 0.0.0.0
wifi-ac3            : 0.0.0.0
ntp-service         : specify
domain              :
wins-server1        : 0.0.0.0
wins-server2        : 0.0.0.0
default-gateway     : 192.168.10.1
next-server         : 0.0.0.0
netmask             : 255.255.255.0
interface           : port2
ip-range:
    == [ 1 ]
    id:     1
timezone-option     : disable
tftp-server         :
filename            :

```



```
https://docs.fortinet.com/document/fortigate-private-cloud/7.6.0/openstack-administration-guide/740208/deploying-a-fortigate-vm-instance-in-an-openstack-environment
```
<br />
