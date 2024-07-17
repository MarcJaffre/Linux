------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Outil d'administration via une interface Web </p>

------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
```
Pour la gestion des environnements Linux, il est fort utile un outil Web pour l'administration.
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------
## II. Outils Web
### A. AaPanel
#### X. Installation du paquet
```bash
clear;
URL=https://www.aapanel.com/script/install_7.0_en.sh;
if [ -f /usr/bin/curl ]; then
 curl -ksSO "$URL";
else
 wget --no-check-certificate -O install.sh "$URL";
fi;
bash install.sh aapanel;
```

```
==================================================================
Congratulations! Installed successfully!
==================================================================
aaPanel Internet Address: https://92.132.218.220:24084/53dfbb0a
aaPanel Internal Address: https://192.168.0.55:24084/53dfbb0a
username: w3yoat0r
password: 2af6bc98
```


<br />

#### X. Gestion du service
```bash
clear;
systemctl enable  --now bt;
systemctl disable --now bt;
systemctl stop    bt;
systemctl start   bt;
systemctl restart bt;
```

#### X. Afficher les ports
```bash
clear;
cat /www/server/panel/data/port.pl
```

#### X. Script de Sauvegarde
Le script sauvegarde arrête docker pendant la création de la sauvegarde compresser puis le transfert sur le serveur. A la fin du transfert, docker est démarrer.
```bash
#!/usr/bin/bash

################################################################################
# Pre-requis #
##############
# scp, ssh, sshpass et tar 

################################################################################
# Variables #
#############
IP="192.168.20.3"
USER="marc"
PASS="admin"
SOURCE="/var/lib/docker/"
DESTINATION="/mnt/Media_5/Test/"
DATE=$(date '+%Y%m%d_%H%M%S')

################################################################################
# Arret du service Docker localement #
######################################
systemctl stop docker.socket;
systemctl stop docker.service;

################################################################################
# Sauvegarde #
##############
rm /tmp/${DATE}.tar.gz 2>/dev/null;
tar czvf /tmp/${DATE}.tar.gz $SOURCE;

################################################################################
# Securite #
############
sshpass -p $PASS ssh $USER@$IP rm -r $DESTINATION/${DATE}* 2>/dev/null;

################################################################################
# Transfert de la sauvegarde #
##############################
sshpass -p $PASS  scp /tmp/${DATE}.tar.gz $USER@$IP:$DESTINATION/${DATE}.tar.gz;

################################################################################
# Verification #
################
sshpass -p $PASS ssh $USER@$IP ls $DESTINATION/
sshpass -p $PASS ssh $USER@$IP ls $DESTINATION/${DATE}.tar.gz;

################################################################################
# Demarrage du service Docker localement #
##########################################
systemctl start docker.socket;
systemctl start docker.service;

################################################################################
```


#### X. Script de Restauration
Le script de restauration arrête docker pendant la restauration. Il renommer l'ancien dossier Docker en `Docker.DATE` puis restaure docker depuis la sauvegarde.
```bash
#!/usr/bin/bash

################################################################################
# Variables #
#############
IP="192.168.20.3"
USER="marc"
PASS="admin"
SOURCE="/mnt/Media_5/Test/"
DESTINATION="/var/lib/docker"
DATE="2024-07-18_001914"

################################################################################
# Arret du service Docker localement #
######################################
systemctl stop docker.socket;
systemctl stop docker.service;


################################################################################
# Telecharger Backup #
######################
sshpass -p $PASS scp $USER@$IP:$SOURCE/${DATE}.tar.gz /tmp/backup.tar.gz;

################################################################################
# Extraction #
##############
tar -xvf /tmp/backup.tar.gz -C /tmp;

################################################################################
# Docker #
##########
if [ $DATE != "" ];then
 mv $DESTINATION $DESTINATION.${DATE);
 mv /tmp/var/lib/docker $DESTINATION;
fi

################################################################################
# Demarrage du service Docker localement #
##########################################
systemctl start docker.socket;
systemctl start docker.service;

```




<br />

### B. Ajenti (KO)
17-07-2024 : Installation de plugin buggué !

#### X. Installation
```bash
clear;
URL=https://raw.githubusercontent.com/ajenti/ajenti/master/scripts/install.sh;

if [ -f /usr/bin/curl ]; then
 curl -ksSO "$URL";
else
 wget --no-check-certificate -O install.sh "$URL";
 # Fix Erreur
 sed -i -e "s/\$PYTHON3 -m pip install -U pip wheel setuptools/\$PYTHON3 -m pip install -U pip wheel setuptools --break-system-packages/g"  ./install.sh
 sed -i -e "s/\$PYTHON3 -m pip uninstall -y gevent-socketio gevent-socketio-hartwork/\$PYTHON3 -m pip uninstall -y gevent-socketio gevent-socketio-hartwork --break-system-packages/g"  ./install.sh
 sed -i -e "s/ajenti.plugin.packages ajenti.plugin.services/ajenti.plugin.packages ajenti.plugin.services --break-system-packages/g"  ./install.sh
fi;
bash install.sh;
```

```
Ajenti will be listening at https://192.168.0.28:8000
Log in with your root password or another OS user
```

<br />

### C. cPanel
#### X. XXXX
```bash
clear;
```

<br />

### X. Cockpit
#### X. Installation des dépendances
```bash
clear;
apt install -y nfs-common   1>/dev/null;
apt install -y realmd       1>/dev/null;
apt install -y tuned        1>/dev/null;
apt install -y udisks2-lvm2 1>/dev/null;
```

#### X. Installation de Cockpit
```bash
clear;
apt install -y cockpit                1>/dev/null;
apt install -y cockpit-bridge         1>/dev/null;
apt install -y cockpit-machines       1>/dev/null;
apt install -y cockpit-networkmanager 1>/dev/null;
apt install -y cockpit-packagekit     1>/dev/null;
apt install -y cockpit-pcp            1>/dev/null;
apt install -y cockpit-podman         1>/dev/null;
apt install -y cockpit-sosreport      1>/dev/null;
apt install -y cockpit-storaged       1>/dev/null;
apt install -y cockpit-system         1>/dev/null;
apt install -y cockpit-tests          1>/dev/null;
apt install -y cockpit-ws             1>/dev/null;
```

#### X. Extensions
```bash
clear;
git clone https://github.com/45Drives/cockpit-navigator.git /tmp/cockpit-navigator 2>/dev/null;
cd /tmp/cockpit-navigator 1>/dev/null;
make install;

wget https://github.com/45Drives/cockpit-file-sharing/releases/download/v3.2.9/cockpit-file-sharing_3.2.9-2focal_all.deb -O /tmp/cockpit-file-sharing.deb 2>/dev/null; 
apt install -y /tmp/cockpit-file-sharing.deb 1>/dev/null;

wget https://github.com/45Drives/cockpit-identities/releases/download/v0.1.12/cockpit-identities_0.1.12-1focal_all.deb -O /tmp/cockpit-identities.deb 2>/dev/null;
apt install -y /tmp/cockpit-identities.deb 1>/dev/null;
```


<br />

### X. Froxlor
#### X. XXXX
```bash
clear;
```

### X. ISPConfig
#### X. XXXX
```bash
clear;
```

<br />

### X. Sentroa
#### X. XXXX
```bash
clear;
```

<br />

### X. VestaCP
#### X. XXXX
```bash
clear;
```

<br />

### X. Virtualmin
#### X. XXXX
```bash
clear;
```

<br />

### X. Webmin
#### X. XXXX
```bash
clear;
```
