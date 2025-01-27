
---------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Création d'une VM Sophos </p>
---------------------------------------------------------------------------------------------------------------------------------------
## I. Fortigate
### A. Télécharger Fortigate
Aller sur le site [Sophos](https://www.sophos.com/en-us/support/downloads/firewall-installers). 

Télécharger le fichier `Virtual Installers: Firewall OS for KVM`.



<br />

### B. Transfert de fichier
Envoyé le fichier via un client SFTP dans le dossier /tmp.

### C. Création de la VM
Créer une VM sans stockage. 

### D. Importer le Disque
Le stockage se nomme `Data`
```bash
clear;
qm importdisk XXX /tmp/Sophos.qcow2 <NOM DU STOCKAGE>
```

<br />

### E. Attacher le Stockage
Le disque dur est en status inutilisé, il faut l'attacher sur la VM.

### F. Boot Menu
Définir le disque dur comme démarrage.

### G. Ajouter une carte-réseau
Pour avoir un LAN, il est nécessaire d'attacher une seconde carte réseau

### H. Démarrer
La VM est prête

<br/>


```
https://docs.fortinet.com/document/fortigate-private-cloud/7.6.0/openstack-administration-guide/740208/deploying-a-fortigate-vm-instance-in-an-openstack-environment
```
