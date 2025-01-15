------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Outil d'administration via une interface Web </p>

------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
```
Pour la gestion des environnements Linux, il est fort utile un outil Web pour l'administration.
```

<br />

#### X. Script de Sauvegarde (BUG RECOVERY)
Le script sauvegarde arrête docker pendant la création de la sauvegarde compresser puis le transfert sur le serveur. A la fin du transfert, docker est démarrer.
```bash
#!/usr/bin/bash


################################################################################
# Pre-requis #
##############
# apt install -y sshpass tar

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


#### X. Script de Restauration (BUG RECOVERY)
Le script de restauration arrête docker pendant la restauration. Il renommer l'ancien dossier Docker en `Docker.DATE` puis restaure docker depuis la sauvegarde.
```bash
#!/usr/bin/bash

################################################################################
# Pre-requis #
##############
# apt install -y sshpass tar

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
tar -xf /tmp/backup.tar.gz -C /tmp 1>/dev/null;

################################################################################
# Docker #
##########
mv $DESTINATION $DESTINATION.${DATE};
mv /tmp/var/lib/docker $DESTINATION;

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
