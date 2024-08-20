------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Gestions des Groupes et utilisateurs </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
```
SU   : Switch User
SUDO : Substitute User DO
```

<br />


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
### II. Gestions des utilisateurs & groupes
#### A. Utilisateurs
Le fichier `/etc/passwd` contient la liste des utilisateurs.

```
<USER>:<Mot de passe*>:<UID>:<GUID>:<COMMENTAIRE>:<Repertoire Personnel>:<Shell de connexion
marc:x:1000:100:,0,teste@mail.com,Admin:/home/marc:/bin/sh

* Les mots de passes sont gérés dans un autre fichier.
```


#### B. Ajouter un utilisateur
##### 1. Profil par défaut
Contient les options de création d'un utilisateur par défaut.
```
cat /etc/default/useradd
```

##### 2. Création / Suppression d'un utilisation
```
useradd --base-dir /home/marc --comment 'Marc Jaffré' --home-dir /home/marc --gid 1000 --shell /bin/bash marc
userdel -r marc;
```

##### 3. Définition login
Contient les paramètres de création d'un utilisateur par défaut.
```
cat /etc/login.defs;
```

#### C. Modification de l'utilisateur
Le paramètre `gid` est le groupe primaire et `groups` sont les groupes supplémentaires.
```
usermod \
--home "/home/marc" \
--comment "Administrateur" \
--gid root \
--groups wheel \
--shell /bin/nologin \
-L \
marc
```

#### X. 
#### X. Groupes

<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Guide d'utilisation

#### A. Changer d'utilisateur
Le tiret permet de charger le profil de l'utilisateur !
```bash
su - <USER> ; # Utilisateur
su -        ; # Root
su - root   ; # Root
```

<br />

#### B. Utilisation de sudo
La commande permet de lancer une commande en administrateur. Elle son journalisé.
```bash
sudo <COMMANDE>
sudo ifconfig
```

#### C. Journalisation
Le fchier Secure contient les événéments liée à Sudo.
```bash
tail /var/log/secure
```

<br />

#### D. Groupe Wheel
Un utilisateur appartenant au groupe `WHEEL` est un `administrateur` du système.

Pour ajouter un utilisateur au groupe `WHEEL`, il suffit de taper la commande suivante:

```bash
usermod -aG wheel <USER>
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### IV. Gestion de Sudo (Expérimental)
#### A. Sudoers ([GUIDE](https://n0tes.fr/2022/01/20/Le-fichier-sudoers/))

La bonne manière d'éditer le fichier sudo est d'utiliser commande `visudo` qui édite le fichier `/etc/sudoer`.

#### B. Utilisation des alias
Un alias permet de regrouper des éléments . (Host, User et Commande)

##### 1. Host
Alias qui regroupe des machines.
```bash
Host_Alias = REDHAT01
```

##### 2. User
Alias qui regroupe des utilisateurs
```bash
User_Alias NET_GRP = <USER 1>, <USER 2> ..... 
```

##### 3. Command
Alias qui regroupe des commandes.
```bash
Cmnd_Alias NET_CMD = /usr/bin/XXX, /usr/sbin/XXX ...
```

##### 4. Application
```bash
NET_GRP ALL = NET_CMD
NET_GRP ALL = NOPASSWD: NET_CMD
```

