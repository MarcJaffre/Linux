------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Gestions des interfaces réseaux </p>

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
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. NMCLI (Base)
#### A. Présentation de NMCLI
NMCLI permet l'édition des fichiers de script en modifiant les fichiers ifcfg-`<INTERFACE>`

#### B. Les périphériques
##### 1. Afficher les Périphériques
```bash
clear;
nmcli device status;
```
![image](https://github.com/user-attachments/assets/f8bf74a5-9ddd-427b-b906-018e65151663)

##### 2. Afficher l'ensemble des périphériques
```bash
clear;
nmcli device show;
```
![image](https://github.com/user-attachments/assets/46b4e3c7-dfd4-4134-9629-ec0d1f6ceb2c)

##### 3. Afficher un périphérique
```bash
clear;
nmcli device show ens18;
```
![image](https://github.com/user-attachments/assets/8e70b094-f636-4df0-bf90-f2251590bd1c)


#### D. Les connexions
##### 1. Afficher les connexions
Ceci permet d'afficher les connexions . (Nom, UUID, Type et Périphérîque)
```bash
clear;
nmcli connection show;
```
![image](https://github.com/user-attachments/assets/cf16a6bd-0616-41b4-91ab-751aa3f6cd43)

##### 2. Supprimer une connexion
```bash
clear;
nmcli connection delete <NOM>;
nmcli connection delete <UUID>;
```

##### 3. Ajouter une connexion de type Ethernet

```bash
clear;
nmcli connection add type ethernet con-name <NAME_CUSTOM> ifname <INTERFACE>;
```

![image](https://github.com/user-attachments/assets/918bc729-24af-4a9c-a37e-856d705e102d)

![image](https://github.com/user-attachments/assets/6c2ea1db-a934-4bbd-b6e5-b96596a1f7a3)

##### 4. Afficher les configurations
```bash
clear;
ls /etc/NetworkManager/system-connections/
```
##### 5a. Configurer la connexion (DHCP)
```bash
clear;
nmcli connection modify <NAME_CUSTOM> ipv4.method auto;
```

##### 5b. Configurer la connexion (Disabled)
```bash
clear;
nmcli connection modify <NAME_CUSTOM> ipv4.method disabled;
```

##### 5c. Configurer la connexion (Static)
```bash
clear;
nmcli connection down <NAME_CUSTOM>;
nmcli connection modify <NAME_CUSTOM> ipv4.addresses <CIDR>;
nmcli connection modify <NAME_CUSTOM> ipv4.gateway <IP>;
nmcli connection modify <NAME_CUSTOM> ipv4.dns;
nmcli connection modify <NAME_CUSTOM> ipv4.method manual;
nmcli connection up <NAME_CUSTOM>;
```

##### 6. Editer la configuration
```bash
clear;
nmcli connection edit <NAME_CUSTOM>;
```

<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. NMCLI (Avancés)
#### A. Création d'un Bridge
```bash
clear;
nmcli connection delete bridge0;
nmcli connection add type bridge con-name bridge0 ifname br0;
nmcli connection modify bridge0 ipv4.addresses 192.168.200.143/24;
nmcli connection modify bridge0 ipv4.gateway 192.168.200.1;
nmcli connection modify bridge0 ipv4.dns 192.168.200.1;
nmcli connection modify bridge0 ipv4.method manual;
```
#### B. Afficher les informations du Bridge
```bash
clear;
nmcli connection show bridge0 | grep -v "\--" | grep "connection\|ipv4";  
```

#### C. Attacher des ports au bridge0
```bash
clear;
nmcli connection add type bridge-slave con-name bridge0-p1

nmcli connection add type bridge-slave con-name bridge0-port1 ifname ens18 master br0;
nmcli connection show bridge0-port1;
nmcli connection show bridge0;


<br />
<br />



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Autres
```
- nmcli
- nm-tool
- nmtui
- nmgui
```


<br />
<br />
