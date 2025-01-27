
---------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Création d'une VM Sophos </p>
---------------------------------------------------------------------------------------------------------------------------------------
## I. Sophos
### A. Télécharger Sophos
Aller sur le site [Sophos](https://www.sophos.com/en-us/support/downloads/firewall-installers). 

Télécharger le fichier `Virtual Installers: Firewall OS for KVM`.


### B. Extraire le ZIP
Extrairer le fichier compresser via `7ZIP`.


### C. Transfert de fichier
Envoyé les fichiers `QCOW2` via un client SFTP dans le dossier /tmp.


### D. Création de la VM
Créer une VM sans stockage. 

### E. Importer le Disque
Le stockage se nomme `Data`
```bash
clear;
qm importdisk XXX /tmp/PRIMARY-DISK.qcow2   <NOM DU STOCKAGE>
qm importdisk XXX /tmp/AUXILIARY-DISK.qcow2 <NOM DU STOCKAGE>
```

<br />

### F. Attacher le Stockage
Le disque dur est en status inutilisé, il faut l'attacher sur la VM.

### G. Boot Menu
Définir le disque dur comme démarrage.

### H. Ajouter une carte-réseau
Pour avoir un LAN, il est nécessaire d'attacher une seconde carte réseau

### I. Démarrer
La VM est prête

<br/>


```
https://docs.sophos.com/nsg/sophos-firewall/19.5/Help/en-us/webhelp/onlinehelp/VirtualAndSoftwareAppliancesHelp/KVM/index.html
```
