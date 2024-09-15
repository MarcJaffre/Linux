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
lsb_release -a;
```

### E. Avertissement
```
- La version 11 de PostgreSQL est obsolète, mais le paquet du client ou du serveur est toujours installé.
- Veuillez installer la version la plus récente des paquets postgresql-13 et postgresql-client-13 et mettre à niveau les grappes (« clusters ») en version  avec « pg_upgradecluster ».
- Veuillez noter que l'installation de postgresql-13 créera par défaut une grappe (« cluster ») 13/main.
- Si vous souhaitez mettre à niveau la grappe 11/main, il faudra supprimer la grappe 13 en exécutant la commande « pg_dropcluster--stop 13 main ». 
- Les anciennes versions des paquets client et serveur ne sont plus maintenues. 
- Après la mise à niveau des grappes (« clusters »), les paquets postgresql-11 et postgresql-client-11 devraient être supprimés.                                                                                            ```


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
