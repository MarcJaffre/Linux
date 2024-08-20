------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Gestîons des interfaces réseaux </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. NetworkManager
#### A. Présentation
RedHat utilise des scripts pour la configuration des interfaces réseaux.

<br />

#### B. Qu'est qu'une interface ?
Un `device` est une interface réseau

La `Connection` un ensemble de pararmètres afin de configurer un `Device`

Chaque `Connection` porte un `Nom`, `UID`, un `Type` et un `Device`.

<br />

#### C. Exemple
```bash
clear;
cat /etc/sysconfig/network-script;
```

```
TYPE=Ethernet
BOOTPROTO=NONE
DEFROUTE=yes
NAME=eth0
UUID=
DEVICE=eth0
ONBOOT=yes
IPADDR=192.168.0.100
PREFIX=24
GATEWAY=192.168.0.1
DNS1=192.168.0.1
DNS2=8.8.8.8
```



#### D.
#### E.
#### F.
#### G



<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. NMCLI

```
- nmcli
- nm-tool
- nmtui
- nmgui
```
