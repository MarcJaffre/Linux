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
### A. Reset Factory
```bash
execute factoryreset
```

### B. Premier démarrage
Lors du premier démarrage, indiquer comme identifiant `admin` et comme mot de passe `vide`.


```

config system interface

# Configuration WAN
edit "port1"
    set mode static
    set ip 192.168.0.44 255.255.255.0
    set name WAN
    set alias "WAN"
    set role wan
    set allowaccess ping ssh http https
next

# Configuration LAN
edit "port2"
    set mode static
    set ip 192.168.10.1 255.255.255.0
    set name LAN
    set alias "LAN"
    set role lan
    set allowaccess ping ssh http https
end

# Configuration de la passerelle
config router static
edit 1
    set gateway 192.168.0.1
    set device "port1"
next
end

# Configuration du DNS
config system dns
    set primary 8.8.8.8
    set secondary 8.8.4.4
end

# Configuration du DHCP
config system dhcp server
    edit 1
        set interface "port2"
        set lease-time 86400
        set netmask 255.255.255.0
        config ip-range
            edit 1
                set start-ip 192.168.10.2
                set end-ip 192.168.10.10
            next
        end
        set default-gateway 192.168.10.1
        set dns-server1 8.8.8.8
        set dns-server2 8.8.4.4
        set status enable
    next
end

# Configuration globale
config system global
    set hostname fortigate
    set language french
    set timezone Europe/Paris
end

execute ping google.fr
```




```
https://docs.fortinet.com/document/fortigate-private-cloud/7.6.0/openstack-administration-guide/740208/deploying-a-fortigate-vm-instance-in-an-openstack-environment
```

