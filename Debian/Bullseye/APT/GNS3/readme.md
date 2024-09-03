------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Déploiement de GNS3 sur Debian </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation de l'environnement
#### A. Machine Virtuelle
```
Distribution  : Debian 11
Version       : Bullseye
Disque-dur    : 32 Go
Processeur    : 4 Core (IntelVT-X ou AMD-V Imbriqué)
Mémoire-vive  : 8 Go
Carte-réseau  : Pont (Bridge)
```

#### B. Présentation
```
La Machine Virtuelle GNS sera sur le réseau Physique et aura comme IP 192.168.0.10.
Le client sous Windows pourra se connecter sur la VM.
Celui-ci n'aura pas besoin de puissance machine pour la piloter.
Pour faciliter la gestion des données, un partage Samba serait une bonne idée.
```

#### C. Souris dans les VM
Pour éviter d'avoir la souris décaler, il suffit d'ajouter dans la partie Options
```
- Editer l'équipement
- Onglet Advanced
- Options: -usbdevice tablet
```
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/e68c667c-1af4-4d82-a6a3-be13eb047089' /> </p>

#### D. [Configuration du stockage](https://docs.gns3.com/docs/using-gns3/administration/gns3-server-configuration-file/)
```
nano ~/.config/GNS3/2.2/gns3_server.conf;
```

```
[Server]
ubridge_path             = /Applications/GNS3.app/Contents/Resources/ubridge
images_path              = /gns3/images
projects_path            = /gns3/projects
appliances_path          = /gns3/appliances
host                     = 0.0.0.0
port                     = 3080
auth                     = True
user                     = admin
password                 = admin
report_errors            = False
console_start_port_range = 2001
console_end_port_range   = 5000
udp_start_port_range     = 10000
udp_end_port_range       = 20000

[VPCS]
vpcs_path                  = /usr/local/bin/vpcs

[Dynamips]
dynamips_path              = /usr/local/bin/dynamips
allocate_aux_console_ports = False
sparse_memory_support      = True
ghost_ios_support          = True
mmap_support               = True

[IOU]
iouyap_path                = /usr/local/bin/iouyap
iourc_path                 = /gns3/.iourc
license_check              = True

[VirtualBox]
vboxmanage_path = /usr/local/bin/VBoxManage
vbox_user =

[VMware]
vmrun_path = /Applications/VMware Fusion.app/Contents/Library/vmrun
vmnet_start_range = 2
vmnet_end_range = 50
host_type = fusion
```



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Installation du Système
#### A. Définir un nom de machine
```bash
clear;
NAME=gns3
DOMAINE="LAN"
hostnamectl set-hostname $NAME;

echo "127.0.0.1    localhost
127.0.1.1    ${NAME}.${DOMAINE} ${NAME}" > /etc/hosts;
```

#### B. Définir la langue du système 
```bash
clear;
localectl set-locale "fr_FR.UTF-8";
localectl set-keymap "fr";
localectl set-x11-keymap "fr" "pc105" "latin9" "terminate:ctrl_alt_bksp";
systemctl restart console-setup.service;
```

#### C. Définir un fuseau horaire
```bash
clear;
timedatectl set-timezone Europe/Paris;
timedatectl set-ntp true;
timedatectl set-local-rtc false;
```

#### D. Définir un serveur de Temps
```bash
clear;
echo "[Time]
NTP=0.debian.pool.ntp.org
#FallbackNTP=0.debian.pool.ntp.org 1.debian.pool.ntp.org 2.debian.pool.ntp.org 3.debian.pool.ntp.org" > /etc/systemd/timesyncd.conf;
systemctl restart systemd-timesyncd.service;
```

#### E. Configurer la carte-réseau
Le service NetworkManager est pas compatible avec Networking, il faudra choisir .
```bash
clear;
# ------------------------------------------------------------------------------
NAME=$(hostname)
DOMAINE=$(cat /etc/hosts | grep $NAME | cut -c 11-20 | cut -d "." -f 2)
NET=$(ip link | grep "2: " | cut -d ":" -f 2 | cut -c 2-10)
IP=192.168.0.10
MASK=255.255.255.0
GW=192.168.0.1
DNS1=192.168.0.1
DNS1=8.8.8.8

echo "##########################################
source /etc/network/interfaces.d/*
##########################################
# Adresse de bouclage
auto lo
iface lo inet loopback
##########################################
# Interface principale en Statique
auto ${NET}
allow-hotplug ${NET}
iface ${NET} inet static
 address ${IP}
 netmask ${MASK}
 gateway ${GW}
 dns-nameservers ${DNS1} ${DNS2}
##########################################" > /etc/network/interfaces;
systemctl restart networking;

# Ajouter IP dans Hosts
echo "$IP $NAME.$DOMAINE $NAME" >> /etc/hosts
```

#### F. Dépôt de base
```bash
clear;

# Chargement du fichier
source /etc/os-release;

echo "# --------------------------------------------------------------------------------------------
deb http://ftp.fr.debian.org/debian/               $VERSION_CODENAME main contrib non-free
deb-src http://ftp.fr.debian.org/debian/           $VERSION_CODENAME main
# --------------------------------------------------------------------------------------------
deb http://security.debian.org/debian-security     $VERSION_CODENAME-security main contrib
deb-src http://security.debian.org/debian-security $VERSION_CODENAME-security main contrib

# --------------------------------------------------------------------------------------------
# bullseye-updates, to get updates before a point release is made;
# see https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_updates_and_backports
deb http://ftp.fr.debian.org/debian/               $VERSION_CODENAME-updates main contrib
deb-src http://ftp.fr.debian.org/debian/           $VERSION_CODENAME-updates main contrib
# --------------------------------------------------------------------------------------------" > /etc/apt/sources.list;
```

#### G. Mise à jour du système
```bash
clear;
apt update     1>/dev/null;
apt upgrade -y 1>/dev/null;
```

#### H. Paquets indispensables
Le paquet Networking utilise `ifdownup2` et `resolvoconf` pour la gestion de la carte-réseau.
```bash
clear;
apt install -y htop       1>/dev/null;
apt install -y ifupdown2  1>/dev/null;
apt install -y resolvconf 1>/dev/null;
apt install -y sudo       1>/dev/null;
reboot;
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Déploiement de GNS3
#### A. Installation des outils indispensables
```bash
clear;

# GNS3
apt install -y apt-transport-https         1>/dev/null;
apt install -y build-essential             1>/dev/null;
apt install -y ca-certificates             1>/dev/null;
apt install -y curl                        1>/dev/null;
apt install -y git                         1>/dev/null;
apt install -y gnupg2                      1>/dev/null;

# Ubridge
apt install -y libpcap-dev                 1>/dev/null;
apt install -y pcaputils                   1>/dev/null;
apt install -y software-properties-common  1>/dev/null;

# Dynamips:
apt install -y cmake                       1>/dev/null;
apt install -y libelf-dev                  1>/dev/null;
apt install -y libpcap-dev                 1>/dev/null;
```

#### B. Installation des dépendances
```bash
clear;
apt install -y libvirt-clients            1>/dev/null;
apt install -y libvirt-daemon-system      1>/dev/null;
apt install -y python3-pip                1>/dev/null;
apt install -y python3-pyqt5              1>/dev/null;
apt install -y python3-pyqt5.qtsvg        1>/dev/null;
apt install -y python3-pyqt5.qtwebsockets 1>/dev/null;
#apt install -y qemu                       1>/dev/null;
apt install -y qemu-kvm                   1>/dev/null;
apt install -y qemu-utils                 1>/dev/null;
apt install -y virtinst                   1>/dev/null;
apt install -y xtightvncviewer            1>/dev/null;

DEBIAN_FRONTEND=noninteractive apt install -y wireshark 1>/dev/null;
```

#### C. Installation de GNS3
```bash
clear;

# GNS3 Serveur
pip3 install gns3-server --break-system-packages 1>/dev/null;

# GNS3 GUI (Optionnel)
pip3 install gns3-gui    --break-system-packages 1>/dev/null;
```

#### D. Installation d'Ubridge
```bash
clear;
cd;
rm -r /tmp/ubridge 2>/dev/null;
git clone https://github.com/GNS3/ubridge.git /tmp/ubridge 2>/dev/null;
cd /tmp/ubridge;
make 1>/dev/null;
make install 1>/dev/null;
ubridge version;
```

#### E. Installation de Dynamips
```bash
clear;
cd;
rm -r /tmp/dynamips 2>/dev/null;
git clone https://github.com/GNS3/dynamips.git /tmp/dynamips 2>/dev/null;
cd /tmp/dynamips;
mkdir build;
cd build;
cmake .. 1>/dev/null
make install &>/dev/null;
which dynamips;
```

#### F. Le pont virbr0
Pour permettre au machine virtuelle d'avoir internet, il faut créer un pont qui sera rattaché à l'interface physique.

Le pont recevra la configuration réseau.

```bash
clear;
apt install -y bridge-utils;

NET=$(ip link | grep "2: "         | cut -d ":" -f 2 | cut -c 2-10)
IP=$(cat /etc/network/interfaces   | grep $NET -A4 | grep add | cut -c 10-30)
MASK=$(cat /etc/network/interfaces | grep $NET -A4 | grep netmask | cut -c 10-30)
GW=$(cat /etc/network/interfaces   | grep $NET -A4 | grep gateway | cut -c 10-30)
DNS=$(cat /etc/network/interfaces  | grep $NET -A4 | grep dns     | cut -c 18-25)


echo "##########################################################################################
source /etc/network/interfaces.d/*
##########################################################################################
# Adresse de bouclage #
#######################
auto lo
iface lo inet loopback

##########################################################################################
# Interface Physique #
######################
auto $NET
iface $NET inet manual

auto virbr0
iface virbr0 inet static
#bridge_ports     none             # si vous ne voulez ponter aucun port
 bridge_ports     $NET
 bridge_stp       off              # désactiver le protocole Spanning Tree
 bridge_waitport  0                # pas de délais avant qu'un port soit disponible
 bridge_fd        0                # pas de délais de transfert
 address          $IP
 netmask          $MASK
 gateway          $GW
 dns-nameservers  $DNS

##########################################################################################
# Ponts reseaux supplementaires #
#################################
auto vmbr1
iface vmbr1 inet static
 address          192.168.10.0
 netmask          255.255.255.0
 bridge-ports     none
 bridge_stp       off
 bridge_fd        0

auto vmbr2
iface vmbr2 inet static
 address          192.168.20.0
 netmask          255.255.255.0
 bridge-ports     none
 bridge_stp       off
 bridge_fd        0

auto vmbr3
iface vmbr3 inet static
 address          192.168.30.0
 netmask          255.255.255.0
 bridge-ports     none
 bridge_stp       off
 bridge_fd        0

auto vmbr4
iface vmbr3 inet static
 address          192.168.40.0
 netmask          255.255.255.0
 bridge-ports     none
 bridge_stp       off
 bridge_fd        0

##########################################################################################"> /etc/network/interfaces; less /etc/network/interfaces;
systemctl restart networking;
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### IV. Installation des Templates
#### A. VPCS ([GITHUB](https://github.com/GNS3/vpcs/releases))
```bash
clear;
cd;
rm -r /tmp/*.tar.gz /tmp/vpcs* 2>/dev/null;
wget https://github.com/GNS3/vpcs/archive/refs/tags/v0.8.3.tar.gz -O /tmp/v0.8.3.tar.gz 2>/dev/null;
tar xzf /tmp/v0.8.3.tar.gz -C /tmp/;
cd /tmp/vpcs-0.8.3/src;
./mk.sh 1>/dev/null;
mv vpcs /usr/bin/vpcs;
```

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### V. Prise en charge de Docker
#### A. Ajout du dépôt
```bash
clear;

# Chargement du fichier
source /etc/os-release;

# Attributs
install -m 0755 -d /etc/apt/keyrings;

# Clé GPG
curl -fsSL https://download.docker.com/linux/debian/gpg |  gpg --dearmor -o /etc/apt/keyrings/docker.gpg;

# Permission
chmod a+r /etc/apt/keyrings/docker.gpg;

# Dépôt
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $VERSION_CODENAME stable" > /etc/apt/sources.list.d/docker.list;

# Mise à jour
apt update 1>/dev/null;
```

#### B. Installation de Docker
```bash
clear;
apt install -y docker-ce             1>/dev/null;
apt install -y docker-ce-cli         1>/dev/null;
apt install -y containerd.io         1>/dev/null;
apt install -y docker-buildx-plugin  1>/dev/null;
apt install -y docker-compose-plugin 1>/dev/null;
docker --version
```

#### B. Installation de Docker-Compose
```bash
clear;
curl -SL https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose 2>/dev/null;
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose;
chmod +x /usr/local/bin/docker-compose;
docker-compose --version;
```
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### VI. Démarrage du serveur GNS3
#### A. Lancement ponctuel
```bash
clear;
/usr/local/bin/gns3server;
```

#### B. Lancement par service
```bash
GNS3_UID=$(id -u -n 1000)
GNS3_GUID=$(id -g -n 1000)

# Paramètres:
# --port 8080
# --logmaxsize 10
# --pid /home/marc/GNS.pid

echo "[Unit]
Description=GNS3 server
Wants=network-online.target
After=network.target network-online.target

[Service]
User=root
Group=root
ExecStart=/usr/local/bin/gns3server
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/gns3erver.service;

systemctl daemon-reload;
systemctl start gns3erver.service;
systemctl status gns3erver.service;
systemctl enable gns3erver.service;
```

#### C. Data ([Configuration File](https://docs.gns3.com/docs/using-gns3/administration/gns3-server-configuration-file/))
```
su - $(id -u -n 1000);
du -h -d 1 $HOME/GNS3/;
```

#### D. Accéder au panel Web
[GNS3](http://192.168.0.10:3080)

#### E. Configurer le Client
```
- Ouvrir le client GNS3
- Onglet Help
- Setup Wizard
- Run appliances on a remote server (advanced usage)
- Host: 192.168.0.10
- Port: 3080
- Enable Authentification: Décocher
- Next

# "C:\Program Files\GNS3\WebClient\gns3-webclient-config.exe"
```

#### F. Script de Fermeture GNS3
```cmd
@echo off
title "Tuer le processus GNS3 et le serveur"
taskkill /f /im gns3.exe
taskkill /f /im gns3server.exe
```

#### G.  virbr0 is missing. You need to install libvirt
```bash
virsh net-list --all
virsh net-start default;
virsh net-autostart default;
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### VII. Samba et WSDD
