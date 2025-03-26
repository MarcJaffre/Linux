------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de LibreNMS </p>
------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Préparation de l'environnement
### A. Configuration réseau
#### 1. Networking
```bash
clear;
# ----------------------------------------------------------------------
INTER_NET=$(ip add | grep "2: " | cut -d: -f 2 | cut -c 2-9)
# ----------------------------------------------------------------------
cat > /etc/network/interfaces << EOF
source /etc/network/interfaces.d/*
auto lo
iface lo inet loopback
EOF
# ----------------------------------------------------------------------
cat > /etc/network/interfaces.d/ethernet << EOF
auto $INTER_NET
allow-hotplug $INTER_NET
iface $INTER_NET inet static
 address 192.168.0.34/24
 gateway 192.168.0.1
EOF
# ----------------------------------------------------------------------
systemctl restart networking;
```

#### 2. Resolv.conf


### B. Configuration Dépôt
```bash
clear;
cat > /etc/apt/sources.list << EOF
deb     http://ftp.fr.debian.org/debian/           bullseye           main non-free
deb-src http://ftp.fr.debian.org/debian/           bullseye           main
deb     http://security.debian.org/debian-security bullseye-security  main contrib
deb-src http://security.debian.org/debian-security bullseye-security  main contrib
deb     http://ftp.fr.debian.org/debian/           bullseye-updates   main contrib
deb-src http://ftp.fr.debian.org/debian/           bullseye-updates   main contrib
EOF
```
