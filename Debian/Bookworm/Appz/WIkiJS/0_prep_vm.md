----------------------------------------------------------------------------------------------------------------------------
# <p alig='center'> Configuration d'un serveur Linux </p>
----------------------------------------------------------------------------------------------------------------------------
## I. Debian
### A. Carte-réseau
Ma carte-réseau se nomme `enp6s18`. Il sera nécessaire d'adapter.
#### 1. Edition du fichier
```bash
clear;
nano /etc/network/interfaces
```

```
auto enp6s18
allow-hotplug enp6s18
iface enp6s18 inet static
   address 192.168.0.18
   netmask 255.255.255.0
   gateway 192.168.0.1
   dns-nameservers 192.168.0.1 8.8.8.8 1.1.1.1
```

### B. Configuration du DNS
#### 1. Edition du fichier
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
```bash
clear;
nano /etc/hosts;
```

```
127.0.0.1       wikijs.home.lan wikijs
192.168.0.18    wikijs.home.lan wikijs
```
### E. Redémarrrage
```bash
reboot
```
### F. Vérification
```bash
hostname --ip-address
```

```
127.0.0.1 192.168.0.18
```

### G. Dépôt
```bash
clear;

nano /etc/apt/sources.list
```

```
deb     http://ftp.fr.debian.org/debian/            bookworm           main non-free-firmware
deb-src http://ftp.fr.debian.org/debian/            bookworm           main non-free-firmware
deb     http://security.debian.org/debian-security  bookworm-security  main non-free-firmware
deb-src http://security.debian.org/debian-security  bookworm-security  main non-free-firmware
deb     http://ftp.fr.debian.org/debian/            bookworm-updates   main non-free-firmware
deb-src http://ftp.fr.debian.org/debian/            bookworm-updates   main non-free-firmware
```

### H. Mise à jour
```bash
clear;

apt update
apt upgrade -y
```

### I. Fuseau horaire
```bash
clear;

dpkg-reconfigure tzdata
```
