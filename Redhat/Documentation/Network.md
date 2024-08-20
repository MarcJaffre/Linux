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

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. NMCLI
#### A. Présentation de NMCLI
NMCLI permet l'édition des fichiers de script en modifiant les fichiers ifcfg-`<INTERFACE>`

#### B. Lister les périphériques
```bash
clear;
nmcli device status;
```

![image](https://github.com/user-attachments/assets/f8bf74a5-9ddd-427b-b906-018e65151663)

#### C. Afficher la configuration des périphériques
##### 1. Afficher l'ensemble des périphériques
```bash
clear;
nmcli device show;
```

![image](https://github.com/user-attachments/assets/46b4e3c7-dfd4-4134-9629-ec0d1f6ceb2c)

##### 2. Afficher un périphérique
```bash
clear;
nmcli device show <interfaces>;
```

![image](https://github.com/user-attachments/assets/8e70b094-f636-4df0-bf90-f2251590bd1c)

#### D.
#### E.
#### F.






```
- nmcli
- nm-tool
- nmtui
- nmgui
```
