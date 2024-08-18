----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de Proxmox Virtual Environnement sur une machine Debian 12 </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
### A. Information Générale
>Proxmox Virtual Environnement est une solution de virtualisation libre basée sur l'hyperviseur Linux KVM, et offre aussi une solution de conteneurs avec LXC. Elle propose un support payant.

### La technologie LVM
La technologie LVM permet la gestion à chaud d'un serveur au niveau de ses partitions.

> Le Volume Physique : PV
>
> Le Volume Groupe   : VG
> 
> Le Volume Logique  : LV


### C. Installation de Debian
#### 1. Présentation
```
root@Proxmox:~# lsblk 
sda                 8:0    0   1,8T  0 disk 
├─sda1              8:1    0   487M  0 part /boot/efi
└─sda2              8:2    0   1,8T  0 part 
  ├─vg0-HOME      254:0    0  93,1G  0 lvm  /home
  ├─vg0-SYSTEM    254:1    0    30G  0 lvm  /
  ├─vg0-SWAP      254:2    0   3,7G  0 lvm  [SWAP]
  ├─vg0-DATA      254:3    0 931,3G  0 lvm  /Data

root@Proxmox:~# pvs
  PV         VG  Fmt  Attr PSize  PFree   
  /dev/sda2  vg0 lvm2 a--  <1,82t <774,37g

root@Proxmox:~# vgs
  VG  #PV #LV #SN Attr   VSize  VFree   
  vg0   1   5   0 wz--n- <1,82t <774,37g

root@Proxmox:~# lvs
  LV        VG  Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  DATA      vg0 -wi-ao---- 931,32g                                                    
  HOME      vg0 -wi-ao---- <93,13g                                                    
  SWAP      vg0 -wi-ao----   3,72g                                                    
  SYSTEM    vg0 -wi-ao----  30,00g                                                    
```

#### 2. Explication
```
Le disque-dur sda de 1.8 To est partitionnée en 2.
 > La partition 1 (sda1) est le démarrage EFI.
 > La partition 2 (sda2) est une partition LVM

La partition 2 (LVM) est dans le groupe de volume vg0
Le groupe vg0 dispose de plusieurs volume logique (HOME, SYSTEM, SWAP, DATA)
L'espace disponible dans vg0 n'est pas totalement consommée pour permettre d'étendre à la demande les volumes logiques.
```



### D. Sources
```
- https://pve.proxmox.com/wiki/Install_Proxmox_VE_on_Debian_12_Bookworm
- https://pve.proxmox.com/wiki/Network_Configuration#_default_configuration_using_a_bridge
```

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Installation de Proxmox
### A. Information
> Dans le cas d'une installation de Proxmox sur une machine ayant une interface graphique, il sera nécessaire de désactiver le service NetworkManager qui permet la gestion de l'interface réseau via une interface Utilisateur. (Perte de GUI pour la configuration réseau)


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

<br />

### X. Pré-requis
#### 1. Paquets nécessaire
```bash
clear;
apt install -y curl;
apt install -y bridge-utils;
apt install -y lvm2;
apt install -y wget;
```

<br />

### X. Configuration du Réseau
La configuration suivante sera la version définitive de Proxmox.
```
- L'interface physique est mise en mode manual (UP)
- Le pont se lance, il à une ipv4 et attache l'interface physique.
- Le paquet resolvconf (ipv4) et rdnssd (ipv6) semble poser problème.
- Le service NetworkManager est arrêté et désactivé.
- Relance du service networking.
 > NetworkManager tenait l'interface réseau.
 > En l'arrêtant sa permit de libérer l'interface.
 > Networking lors de la relance du processus reprend la main sur l'interface.
```

```bash
cat > /etc/network/interfaces << EOF
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
# Nom du pont
auto vmbr0

# Mode static
iface vmbr0 inet static
        # =====================================
        # IPv4
        address 192.168.0.2/24
        # =====================================
        # Passerelle
        gateway 192.168.0.1
        # =====================================
        # Ports attache au pont
        bridge-ports enp3s0
        # =====================================
        # Activation de la fonction STP
        bridge-stp off
        # =====================================
        # Delais de mise en ligne interface
        bridge-fd 0
        # =====================================
##############################################################################
EOF

systemctl disable --now NetworkManager.service;
systemctl restart networking;
```

```
# =================================================================================================================
root@Proxmox:~#  ip address show enp3s0 
#X: enp3s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master vmbr0 state UP group default qlen 1000
#           link/ether 04:d9:f5:82:2c:96 brd ff:ff:ff:ff:ff:ff

root@Proxmox:~#  ip address show vmbr0 
#X: vmbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 72:76:dd:82:98:6e brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.2/24 brd 192.168.0.255 scope global vmbr0

# =================================================================================================================
root@Proxmox:~# ifconfig | grep "enp3s0\|vmbr0" -A7
enp3s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        ether 04:d9:f5:82:2c:96  txqueuelen 1000  (Ethernet)
        RX packets 896563  bytes 1155899318 (1.0 GiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 220239  bytes 47505240 (45.3 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device memory 0xfc900000-fc91ffff
--
vmbr0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.2  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 fe80::7076:ddff:fe82:986e  prefixlen 64  scopeid 0x20<link>
        ether 72:76:dd:82:98:6e  txqueuelen 1000  (Ethernet)
        RX packets 9576  bytes 10342265 (9.8 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2659  bytes 477541 (466.3 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

#### 2. Configuration du Hostname
```
- Configuration du nom de la machine
- Prise en compte du nom de la machine à chaud.
```
```bash
clear;
##################################################
cat > /etc/hostname << EOF
Proxmox
EOF

##################################################
hostnamectl set-hostname Proxmox;
``` 

#### 3. /etc/hosts
```
- Configuration du nom de la machine avec les liens DNS (IP <=> NOM)
- Message retour, si on voit l'IPv4 c'est que c'est bon.
```

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

echo "L'adresse IP de la machine est $(hostname --ip-address)";
```

#### 4. Dépôt Proxmox
```bash
clear 
cat > /etc/apt/sources.list.d/pve-install-repo.list << EOF
deb [arch=amd64] http://download.proxmox.com/debian/pve bookworm pve-no-subscription
EOF
```


#### 5. Clé GPG
Le dépôt Proxmox est signé électroniquement et requiert une clé sécurisée.
```bash
wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg; 
```

#### 6. Mise à niveau du Système
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
Le redémarrage permet de basculer du noyau `Debian` (6.1.0-23-amd64)  au noyau `Proxmox` qui celui-ci inclus de nombreux patch. (Noyau Linux: `6.1.0-23-amd64`)
```bash
clear;
if [ ! $(uname -r | cut -d "-" -f3) = pve ];then systemctl reboot; fi
```


#### X. Vérification du Noyau
La commande retourne la version et le type de noyau et celui-ci devrait se terminé en `XXXXXXXXXXX-PVE`. 
```bash
clear;
uname -r;
```

#### X. Installation des paquets
Lors de l'installation, le menu `Postfix Configuration` apparaît, choisir `Pas de configuration` ou `Local uniquement`. 
```bash
clear;
if [ $(uname -r | cut -d "-" -f3) = pve ];then 
 apt install -y proxmox-ve; # Paquet de base
 apt install -y postfix;    # Mail
 apt install -y open-iscsi; # Prise en charge Iscsi
 apt install -y chrony;     # Synchronisation de Temps
fi
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
#### X. Suppression du dépôt Proxmox (Payant)
```bash
clear;
rm /etc/apt/sources.list.d/pve-enterprise.list;
```

#### X. Panel d'administation
```bash
clear;
echo "Le panel Web est accessible à l'adresse https://$(hostname --ip-address):8006";
```
