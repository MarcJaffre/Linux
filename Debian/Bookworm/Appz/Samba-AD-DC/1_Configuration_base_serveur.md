------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration du serveur debian de base</p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Configuration du système de base
#### A. Configurer la carte-réseau
Le service NetworkManager est pas compatible avec Networking, il faudra choisir .
```bash
clear;
source /etc/os-ad;

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
 address         ${IP}
 netmask         ${MASK}
 gateway         ${GW}
 dns-nameservers ${DNS1}
 dns-search      $DOMAINE1.$DOMAINE2
 dns-domain      $DOMAINE1.$DOMAINE2
##########################################" > /etc/network/interfaces; 
systemctl restart networking;
```

#### B. Définir un nom de machine
```bash
clear;
source /etc/os-ad;
hostnamectl set-hostname $NOM;
echo "##############################################
127.0.0.1    localhost
127.0.0.1    localhost localhost.localdomain
$IP ${NOM}.${DOMAINE1}.${DOMAINE2} ${NOM}
##############################################" > /etc/hosts; cat /etc/hosts;
```

#### C. Définir la langue du système 
```bash
clear;
apt install -y locales-all 1>/dev/null;
localectl set-locale "fr_FR.UTF-8";
localectl set-keymap "fr";
localectl set-x11-keymap "fr" "pc105" "latin9" "terminate:ctrl_alt_bksp";
systemctl restart console-setup.service;
```

#### D. Définir un fuseau horaire
```bash
clear;
timedatectl set-timezone Europe/Paris;
timedatectl set-ntp true;
timedatectl set-local-rtc false;
```

#### E. Définir un serveur de Temps
```bash
clear;
echo "[Time]
NTP=0.debian.pool.ntp.org
#FallbackNTP=0.debian.pool.ntp.org 1.debian.pool.ntp.org 2.debian.pool.ntp.org 3.debian.pool.ntp.org" > /etc/systemd/timesyncd.conf;
systemctl restart systemd-timesyncd.service;
```

#### F. Dépôt de base
```bash
clear;

# Chargement du fichier
source /etc/os-release;

# Remplace du contenue de sources.list
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

#### H. Paquets Indispensables
```bash
clear;
apt install -y curl                       1>/dev/null;
apt install -y htop                       1>/dev/null;
apt install -y software-properties-common 1>/dev/null;
apt install -y sudo                       1>/dev/null;
apt install -y wget                       1>/dev/null;

```

#### I. Sudoers l'utilisateur
```bash
clear;
source /etc/os-ad;
echo "$UTILISATEUR ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/admin;
```

#### J. Bannières de connexion
```bash
clear;
echo "" > /etc/motd;
```

#### K. Paquets nécessaire pour networking
Le paquet Networking utilise `ifdownup2` et `resolvoconf` pour la gestion de la carte-réseau.

/!\ ifupdown2 est incompatible avec le DHCP !

```bash
clear;
apt install -y resolvconf 1>/dev/null;
#apt install -y ifupdown2  1>/dev/null;
reboot;
```
