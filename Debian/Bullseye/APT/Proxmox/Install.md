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
IP="192.168.0.100"
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
Le retour de la commande devrait indiquer `192.168.0.100 # should return your IP address here`
```bash
clear;
hostname --ip-address;
```

### X. Dépôt Proxmox
#### 1. Clé GPG
```bash
clear;
source /etc/os-release;
wget https://enterprise.proxmox.com/debian/proxmox-release-$VERSION_CODENAME.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-$VERSION_CODENAME.gpg;
```
#### 2. Dépôt
```bash
clear;
source /etc/os-release;
echo "deb [arch=amd64] http://download.proxmox.com/debian/pve $VERSION_CODENAME pve-no-subscription" > /etc/apt/sources.list.d/pve-no-subscription.list;
```

### X. Mise à jour de la liste des paquets
```bash
clear;
apt update;
```

### X. Mise à niveau
```bash
clear;
apt full-upgrade -y;
```

### X. Installation du Noyau PVE
```bash
clear;
apt install pve-kernel-5.15;
```

### X. Installation des paquets PVE Proxmox
```bash
clear;
apt install -y postfix;
apt install -y open-iscsi;
apt install -y proxmox-ve;
```

### X. Suppresion des anciens Noyaux
```bash
clear;
apt remove linux-image-amd64 'linux-image-5.10*';
```

### X. Mise à jour du démarrage
```bash
clear;
update-grub;
```

### X. Supprimer Multi-Boot
```bash
clear;
apt remove -y os-prober;
```

### X. Panel d'administration
```bash
clear;
echo "Le panel d'administration de Proxmox est à l'adresse http://$IP:8006";
```

### X. Redémarrage de la machine
```bash
clear;
reboot;
```



### X.
```bash
```
