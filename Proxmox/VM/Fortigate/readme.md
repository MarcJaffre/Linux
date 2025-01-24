---------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Création d'une VM Fortigate </p>
---------------------------------------------------------------------------------------------------------------------------------------
## I. Fortigate
### A. Télécharger Fortigate
Aller sur le Dashboard de [Fortinet](https://support.fortinet.com/asset/#/dashboard) > `Support` > `VM Images`.  (`Select Platform`: `KVM`)

Télécharger l'image `New deployment of FortiGate for KVM`  : `FGT_VM64_KVM-v7.6.1.F-build3457-FORTINET.out.kvm.zip (105.32 MB)`.

<br />

### B. Transfert de fichier
Envoyé le fichier via un client SFTP dans le dossier /tmp.

### C. Création de la VM
Créer une VM sans stockage. 

### D. Importer le Disque
Le stockage se nomme `Data`
```bash
clear;
qm importdisk XXX /tmp/fortios.qcow2 <NOM DU STOCKAGE>
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

---------------------------------------------------------------------------------------------------------------------------------------
## I. Configuration
### A. Premier démarrage
Lors du premier démarrage, indiquer comme identifiant `admin` et comme mot de passe `vide`.


### B. Configuration IPv4
```
config system interface
edit "port1"
set mode static
set ip 192.168.0.44 255.255.255.0
set allowaccess ping https ssh http
next

edit "port2"
set mode static
set ip 192.168.10.1 255.255.255.0
set allowaccess ping https ssh http

end
```

<br />

### C. Configuration Passerelle
```
config router static
edit 1
set gateway 192.168.0.1
set device "port1"
end
```


```
https://docs.fortinet.com/document/fortigate-private-cloud/7.6.0/openstack-administration-guide/740208/deploying-a-fortigate-vm-instance-in-an-openstack-environment
```
