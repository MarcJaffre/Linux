-----------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration de base du routeur </p>
-----------------------------------------------------------------------------------------------------------------------



### C. Configuration avancée
Se connecter en SSH et injecter la configuration
#### 1. Configuration Global
```bash
config system global
    set hostname fortigate
    set language french
    set timezone Europe/Paris
end
```

#### 2. Définir un alias et la zone du WAN
```
config system interface
edit "port1"
    set alias "WAN"
    set role wan
next
end
```

#### 3. Configuration de la passerelle
```bash
config router static
edit 1
    set gateway 192.168.0.1
    set device "port1"
next
end
```
#### 4. Configuration du DNS (routeur)
```bash
config system dns
    set primary 8.8.8.8
    set secondary 8.8.4.4
end
```


#### 5. Configuration du LAN
```bash
edit "port2"
    set mode static
    set ip 192.168.10.1 255.255.255.0
    set name LAN
    set alias "LAN"
    set role lan
    set allowaccess ping ssh http https
end
```

#### 6. Configuration du DHCP (LAN)

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
        set dns-server1 8.8.8.8
        set dns-server2 8.8.4.4
        set status enable
    next
end
```



```
https://docs.fortinet.com/document/fortigate-private-cloud/7.6.0/openstack-administration-guide/740208/deploying-a-fortigate-vm-instance-in-an-openstack-environment
```
<br />
