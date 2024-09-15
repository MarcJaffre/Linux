---------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Déploiement de 3CX </p>

---------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Installation
### A. Création d'un compte 3CX
### B. Auto-Hebergement
#### 1. Dependance
```bash
clear;
apt install -y dphys-swapfile;
apt install -y gnupg2;
apt install -y net-tools;
```
#### 2. Installation
```bash
clear;
wget -O- http://downloads-global.3cx.com/downloads/3cxpbx/public.key    | apt-key add -
echo "deb http://downloads-global.3cx.com/downloads/debian buster main" | tee /etc/apt/sources.list.d/3cxpbx.list;
apt-get update;
apt-get install 3cxpbx;
```

<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Mise à niveau vers Bullseye
### A. Définir les dépôt Bullseye 
```bash
clear;
cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian bullseye main
EOF
```

### B. Mise à jour
```bash
clear;
apt update;
apt dist-upgrade -y;
apt autoremove   -y;
reboot;
```

### C. Reboot
Il sera nécessaire de redémarre la machine après la mise à niveau
```bash
clear;
reboot;
```

### D. Vérification de la Release
```bash
clear;
lsb_release -a
```

```bash
/var/log/postgresql/postgresql-13-main.log
```


<br />
<br />
<br />
<br />
<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Mise à niveau vers Bookworm
### A. Dépôt Bookworm pour Debian
```bash
clear;
cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian bookworm main
EOF
```

### B. Mise à jour
Il sera nécessaire de redémarre la machine après la mise à niveau
```bash
clear;
apt update;
apt dist-upgrade -y;
apt autoremove   -y;
```

### C. Installation de 3CX pour Bookworm
```bash
clear;
rm /etc/apt/sources.list.d/3cxpbx.list;
wget -O- http://downloads-global.3cx.com/downloads/3cxpbx/public.key      | apt-key add -
echo "deb http://downloads-global.3cx.com/downloads/debian bookworm main" | tee /etc/apt/sources.list.d/3cxpbx.list;
apt-get update;
apt-get install 3cxpbx;
```

### D. Tips
Dans le panel Web, la mise à jour Debian 10 vers 12 lance la commande suivante
```
/usr/sbin/3CXUpgradeDebian10;
```
```
/var/lib/3cxpbx/Instance1/Data/Backups/
```
