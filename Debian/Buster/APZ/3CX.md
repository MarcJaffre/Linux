---------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Déploiement de 3CX </p>

---------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Installation
#### A. Création d'un compte 3CX
#### B. Auto-Hebergement
##### 1. Dependance
```bash
clear;
apt install -y net-tools dphys-swapfile
apt install gnupg2 -y
```
##### 2. Installation
```bash
clear;
wget -O- http://downloads-global.3cx.com/downloads/3cxpbx/public.key    | apt-key add -
echo "deb http://downloads-global.3cx.com/downloads/debian buster main" | tee /etc/apt/sources.list.d/3cxpbx.list;
apt-get update;
apt-get install 3cxpbx;
```

<br />

#### C. Montée de version
##### 1. Dépôt Bullseye pour Debian

```bash
clear;
cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian bullseye main
EOF
```
##### 2. Mise à jour
Il sera nécessaire de redémarre la machine après la mise à niveau
```bash
clear;
apt update;
apt dist-upgrade -y;
apt autoremove   -y;
```

##### 3. Dépôt Bookworm pour Debian
```bash
clear;
cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian bookworm main
EOF
```

##### 4. Mise à jour
Il sera nécessaire de redémarre la machine après la mise à niveau
```bash
clear;
apt update;
apt dist-upgrade -y;
apt autoremove   -y;
```

##### 5. Installation de 3CX pour Bullseye
```bash
clear;
rm /etc/apt/sources.list.d/3cxpbx.list;
wget -O- http://downloads-global.3cx.com/downloads/3cxpbx/public.key      | apt-key add -
echo "deb http://downloads-global.3cx.com/downloads/debian bookworm main" | tee /etc/apt/sources.list.d/3cxpbx.list;
apt-get update;
apt-get install 3cxpbx;
```

##### 6. Tips
Dans le panel Web, la mise à jour Debian 10 vers 12 lance la commande suivante
```
/usr/sbin/3CXUpgradeDebian10
```
