---------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Création d'une VM Fortigate </p>
---------------------------------------------------------------------------------------------------------------------------------------
## I. Fortigate
### A. Télécharger Fortigate
Aller sur le Dashboard de [Fortinet](https://support.fortinet.com/asset/#/dashboard) > `Support` > `VM Images`.  (`Select Platform`: `KVM`)

Prendre l'image `New deployment of FortiGate for KVM`.

```bash
clear;
URL=https://support.fortinet.com/app/download/api/file/ec37d4e5-e805-41e4-98dd-43d04743181f
wget $URL -O /tmp/FGT_VM64_KVM-v7.6.4.F-build3596-FORTINET.out.kvm.zip;
unzip  /tmp/FGT_VM64_KVM-v7.6.4.F-build3596-FORTINET.out.kvm.zip -d /tmp;
```

<br />

### B. Création de la VM
Créer une VM sans stockage.

```
Support for low encryption operation only
Maximum of 1 CPU and 2GiB of memory
Maximum of three interfaces, firewall policies, and routes each
No FortiCare Support
```


### C. Importer le Disque
Le stockage se nomme `Data`
```bash
clear;
STORAGE=Data
VMID=211
qm importdisk $VMID /tmp/fortios.qcow2 $STORAGE;
```

<br />

### D. Attacher le Stockage
Le disque dur est en status inutilisé, il faut l'attacher sur la VM.

```bash
clear;
STORAGE=Data
VMID=211
DIRECTORY=$(cat /etc/pve/storage.cfg  | grep "dir: $STORAGE" -A1 | tail -n 1 | cut -d " " -f 2)
qm set $VMID -sata1 $DIRECTORY/images/$VMID/vm-$VMID-disk-0.raw
```

### E. Boot Menu
Définir le disque dur comme démarrage.

```bash
clear;
VMID=211
qm set $VMID -boot order=sata1
```

### F. Ajouter une carte-réseau
Pour avoir un LAN, il est nécessaire d'attacher une seconde carte réseau
```bash
clear;
VMID=211
qm set 211 -net0 model=e1000,bridge=vmbr0
qm set 211 -net1 model=e1000,bridge=vmbr1
```

### G. Démarrer
La VM est prête

<br/>

---------------------------------------------------------------------------------------------------------------------------------------
## I. Configuration
### A. Premier démarrage
Lors du premier démarrage, indiquer comme identifiant `admin` et comme mot de passe `vide`.

### B. Configuration IPv4
#### 1. WAN
```
config system interface
edit "port1"
set mode static
set ip 192.168.0.44 255.255.255.0
set allowaccess ping https ssh http
```

```
next
```

#### 2. LAN
```bash
edit "port2"
set mode static
set ip 192.168.10.1 255.255.255.0
set allowaccess ping https ssh http
```

```
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

config router static
edit 1
    set gateway 192.168.0.1
    set device "port1"
next
end

config system dns
    set primary 8.8.8.8
    set secondary 8.8.4.4
end
```
