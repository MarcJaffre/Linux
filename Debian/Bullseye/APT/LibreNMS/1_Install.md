------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de LibreNMS </p>
------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Préparation de l'environnement
### A. Configuration réseau
`BC:24:11:D0:7A:A4`.


#### 1. Networking (Loopback)
```bash
clear;
cat > /etc/network/interfaces << EOF
source /etc/network/interfaces.d/*
auto lo
iface lo inet loopback
EOF
```

#### 2. Networking (Ethernet)
```bash
clear;
INTER_NET=$(ip add | grep "2: " | cut -d: -f 2 | cut -c 2-9)

cat > /etc/network/interfaces.d/ethernet << EOF
auto $INTER_NET
allow-hotplug $INTER_NET
iface $INTER_NET inet static
 address 192.168.0.34/24
 gateway 192.168.0.1
EOF
```

#### 3. Resolv.conf
```bash
clear;
cat > /etc/resolv.conf << EOF
domain home.lan
search home.lan
nameserver 192.168.0.1
EOF
```
#### 4. Relance du service
```bash
clear;
systemctl restart networking;
```

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

### C. Mise à jour
```bash
clear;
apt update 1>/dev/null;
apt dist-upgrade -y;
```

### D. Nom de la machine
```bash
clear;

cat > /etc/hostname << EOF
LibreNMS
EOF

cat > /etc/hosts << EOF
127.0.0.1       localhost
127.0.1.1       LibreNMS.home.lan   LibreNMS
192.168.0.34    LibreNMS.home.lan   LibreNMS
EOF
```

### E. Fuseau Horaire
```bash
clear;
timedatectl set-timezone Europe/Paris;
```

### X. MotD
```bash
clear;
cat > /etc/motd << EOF
############
# Librenms #
############
EOF
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Déploiement de LibreNMS
### A. Paquetts
#### 1. Indispensables
```bash
clear;
apt install -y lsb-release;
apt install -y ca-certificates;
apt install -y wget;
apt install -y acl;
apt install -y curl;
apt install -y fping;
apt install -y git;
apt install -y graphviz;
apt install -y imagemagick;
apt install -y mariadb-client;
apt install -y mariadb-server;
apt install -y mtr-tiny;
apt install -y nginx-full;
apt install -y nmap;
apt install -y python3-dotenv;
apt install -y python3-pymysql;
apt install -y python3-redis;
apt install -y python3-setuptools;
apt install -y python3-systemd;
apt install -y python3-pip;
apt install -y rrdtool;
apt install -y snmp;
apt install -y snmpd;
apt install -y unzip;
apt install -y whois;
```

#### 2. PHP 8.2
```bash
clear;
```

#### 3. Extension PHP 8.2
```bash
clear;
apt install -y php-cli php-curl php-fpm php-gd php-gmp php-mbstring php-mysql php-snmp php-xml php-zip
```
