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

