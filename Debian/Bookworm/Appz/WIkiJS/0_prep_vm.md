----------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration d'un serveur Linux </p>
----------------------------------------------------------------------------------------------------------------------------
## I. Debian
### A. Carte-réseau
Ma carte-réseau se nomme `eth0`. Il sera nécessaire d'adapter. Pour récupérer le nom de la carte-réseau `ip address`.

<img width="1391" height="256" alt="image" src="https://github.com/user-attachments/assets/8a893315-2c0c-4639-9573-b38d5d65b4c9" />

#### 1. Edition du fichier
```bash
clear;
nano /etc/network/interfaces;
```

```
auto eth0
allow-hotplug eth0
iface eth0 inet static
   address 192.168.0.18
   netmask 255.255.255.0
   gateway 192.168.0.1
   dns-nameservers 192.168.0.1 8.8.8.8 1.1.1.1
```

### B. Configuration du DNS
#### 1. Edition du fichier
Le domaine de mon serveur est `home.lan`, à adapter en conséquence. Mon routeur est en `192.168.0.1`.
```bash
clear;
nano /etc/resolv.conf;
```
```
domain home.lan
search home.lan
nameserver 192.168.0.1
```

### C. Configuration du nom de la machine
#### 1. Edition du fichier
```bash
nano /etc/hostname;
```
```
wikijs
```

#### 1. Edition du fichier
Le domaine de mon serveur est `home.lan`, à adapter en conséquence. 
```bash
clear;
nano /etc/hosts;
```

```
127.0.0.1       localhost
#127.0.0.1       wikijs.home.lan wikijs

192.168.0.18    wikijs.home.lan wikijs
```
### E. Redémarrrage
```bash
reboot;
```
### F. Vérification
```bash
hostname --ip-address;
```

```
127.0.0.1 192.168.0.18
```

### G. Dépôt
Pour connaitre la version de son système d'exploitation, taper la commande `lsb_release -a`. Dans mon cas c'est `bookworm` et donc dans mon fichier se sera `bookworm`.

<img width="653" height="137" alt="image" src="https://github.com/user-attachments/assets/862b6088-361a-49bc-9d3e-649c90e9ef1d" />


```bash
clear;
nano /etc/apt/sources.list;
```

```
####################################################################################################
# Main #
########
deb     http://ftp.fr.debian.org/debian/            bookworm           main non-free
deb-src http://ftp.fr.debian.org/debian/            bookworm           main non-free

####################################################################################################
# Securite Patch #
##################
deb     http://security.debian.org/debian-security  bookworm-security  main non-free
deb-src http://security.debian.org/debian-security  bookworm-security  main non-free

####################################################################################################
# Fix #
#######
deb     http://ftp.fr.debian.org/debian/            bookworm-updates   main non-free
deb-src http://ftp.fr.debian.org/debian/            bookworm-updates   main non-free
####################################################################################################
```

### H. Mise à jour
```bash
clear;
apt update;
apt upgrade -y;
```

### I. Fuseau horaire
```bash
clear;
dpkg-reconfigure tzdata;
```
