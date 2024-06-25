--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de Proxmox VE sur une machine Debian 11 </p>

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
```
La machine Debian dois disposer de la technologie de virtualisation et avoir la technologie IOMMU activé dans le bios pour permettre d'avoir le maximum de capacité de fonctionnement.
```

<br />

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Préparation de la machine
### A. Hostnames & IP
```bash
clear;
#############################################################
IP="192.168.0.200"
NAME="Proxmox"
GW="192.168.0.1"
DNS="192.168.0.1"
DOMAIN="local.lan"
#############################################################
echo "$NAME" > /etc/hostname;
#############################################################
echo "127.0.0.1       localhost
$IP   $NAME.$DOMAIN $NAME" > /etc/hosts;
#############################################################
```

### X. Vérification de la configuration du HOST
Le retour de la commande devrait indiquer `192.168.0.200 # should return your IP address here`
```bash
clear;
hostname --ip-address;
```

### X. Dépôt Proxmox
#### 1. Clé GPG
```bash
clear;
source /etc/os-release;
wget https://enterprise.proxmox.com/debian/proxmox-release-$VERSION_CODENAME.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-$VERSION_CODENAME.gpg
```
#### 2. Dépôt
```bash
clear;
source /etc/os-release;
echo "deb [arch=amd64] http://download.proxmox.com/debian/pve $VERSION_CODENAME pve-no-subscription" > /etc/apt/sources.list.d/pve-no-subscription.list;
```




### X. 
```bash
```

### X.
```bash
```

### X.
```bash
```

### X.
```bash
```

### X.
```bash
```

### X.
```bash
```

### X.
```bash
```

### X.
```bash
```

### X.
```bash
```

### X.
```bash
```
