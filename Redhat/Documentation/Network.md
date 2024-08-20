------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Gestîons des interfaces réseaux </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. NetworkManager
#### A. Présentation
RedHat utilise des scripts pour la configuration des interfaces réseaux.

<br />

#### B. Qu'est qu'une interface réseau ?
Une interface réseau correspond à un `device`. 

Le `Device` contient un ensemble de paramètres de configuration qu'on nomme `Connction`.

Chaque `Connection` dispose d'`Nom`, d' un `UID`, un `Type` et un `Device` pour permettre son identification.

<br />

#### C. NMCLI
NMCLI permet l'édition des fichiers de script en modifiant les fichiers ifcfg-`<INTERFACE>`



#### D.
#### E.
#### F.



#### G. Scripts
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



<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. NMCLI

```
- nmcli
- nm-tool
- nmtui
- nmgui
```
