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


#### A. Scripts
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

#### D.
#### E.
#### F.





<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. NMCLI
#### A. Présentation de NMCLI
NMCLI permet l'édition des fichiers de script en modifiant les fichiers ifcfg-`<INTERFACE>`

#### B. Lister les périphériques
```bash
clear;
nmcli dev status
```

![image](https://github.com/user-attachments/assets/f8bf74a5-9ddd-427b-b906-018e65151663)

#### C. Afficher la configuration des périphériques
##### 1. Afficher l'ensemble des périphériques
```bash
clear;
nmcli dev show;
nmcli dev show <interfaces>
```

##### 1. Afficher un périphérique
```bash
clear;
nmcli dev show <interfaces>
```

![image](https://github.com/user-attachments/assets/8e70b094-f636-4df0-bf90-f2251590bd1c)




```
- nmcli
- nm-tool
- nmtui
- nmgui
```
