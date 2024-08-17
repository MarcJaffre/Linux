----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de Proxmox Virtual Environnement sur une machine Debian 12 </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
### A. Information Générale
>Proxmox Virtual Environnement est une solution de virtualisation libre basée sur l'hyperviseur Linux KVM, et offre aussi une solution de conteneurs avec LXC. Elle propose un support payant.

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Installation de Proxmox
### A. Information
> Dans le cas d'une installation de Proxmox sur une machine ayant une interface graphique, il sera nécessaire de réaliser quelque action en amont pour ensuite le déployer.

### B. Présentation de la configuration de mon environnement
```
- Nom de machine     : Proxmox
- Nom de domaine     : lan.local
- Interface physique : enp3s0
- Adresse IPv4       : 192.168.0.2
- Masque de S/R      : 24
- Passerelle réseau  : 192.168.0.1
- Serveur DNS        : 192.168.0.1 (Primaire) 8.8.8.8 (secondaire)
```

### X. Pré-requis
#### 1. Paquets nécessaire
```bash
clear;
apt install -y curl;
apt install -y bridge-utils;
apt install -y wget;
```


### X. Configuration du Réseau
La configuration suivante sera la version définitive de Proxmox.
```
- L'interface physique est mise en mode manual (UP)
- Le pont se lance, il à une ipv4 et attache l'interface physique.
- Le paquet resolvconf (ipv4) et rdnssd (ipv6) semble poser problème.
- Le service NetworkManager devra être désactivé dans le cas d'une interface physique.
```

```bash
cat > /etc/networking/interfaces << EOF
##############################################################################
# LoopBack #
############
auto lo
iface lo inet loopback

##############################################################################
# Interface Physique #
######################
iface enp3s0 inet manual

##############################################################################
# Pont Virtuel #
################
auto vmbr0                        # Nom du pont
iface vmbr0 inet static           # Mode static
        address 192.168.0.2/24    # IPv4
        gateway 192.168.0.1       # Passerelle
        bridge-ports enp3s0       # Ports attache au pont
        bridge-stp off            # Activation de la fonction STP
        bridge-fd 0               # Delais de mise en ligne interface
##############################################################################
EOF

systemctl stop NetworkManager.service;
systemctl restart networking;
```

#### 2. Configuration du Hostname
```bash
clear;
cat > /etc/hostname << EOF
Proxmox
EOF
```
 
#### 3. /etc/hosts
La commande ` hostname --ip-address` permettra de confirmer la configuration.
```bash
clear;
cat > /etc/hosts << EOF
##############################################
# IPv4 #
########
127.0.0.1       localhost
192.168.0.2     Proxmox.lan.local Proxmox

##############################################
# IPv6 #
########
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
##############################################
EOF
```

#### 4. Dépôt Proxmox
```bash
clear 
cat > /etc/apt/sources.list.d/pve-install-repo.list << EOF
deb [arch=amd64] http://download.proxmox.com/debian/pve bookworm pve-no-subscription
EOF
```


#### 4. Clé GPG
Le dépôt Proxmox est signé électroniquement et requiert une clé sécurisée.
```bash
wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg 
```

#### 5. Mise à niveau du Système
```bash
clear;
apt update;
apt full-upgrade;
```

#### X. Instation du Noyau Proxmox
```bash
clear;
apt install -y proxmox-default-kernel;
```

#### X. Redémarrage
Le redémarrage permet de basculer sur le noyau `Standart` au noyau `Proxmox` qui inclus de nombreux patch. 
```bash
clear;
systemctl reboot;
```

#### X. Vérification du Noyau
La commande devrait retourner une ligne qui se termine avec `PVE`. 
```bash
clear;
uname -r;
```

#### X. Installation des paquets
```bash
clear;
apt install -y proxmox-ve; # Paquet de base
apt install -y postfix;    # Mail
apt install -y open-iscsi; # Prise en charge Iscsi
apt install -y chrony;     # Synchronisation de Temps
```

#### X. Suppression du Noyau Debian
```bash
clear;

# Suppression des paquets linux-image-W.X.Y-ZZ-amd64
for IMAGE in $(dpkg --list | grep linux-image | cut -c "5-24" | grep -v "linux-image-amd64");do apt remove $IMAGE-amd64; done;

# Suppression du paquet linux-image-amd64
apt remove linux-image-amd64;

# Mise a jour de la liste des noyaux
update-grub;
```

#### X. Suppression de OS-Prober
OS-Prober est un outil de détection multi-démarrage, Proxmox n'est pas compatible avec cette outil.
```bash
clear;
apt remove os-prober;
```
