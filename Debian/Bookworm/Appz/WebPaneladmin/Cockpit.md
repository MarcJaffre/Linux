------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de Cockpit </p>
------------------------------------------------------------------------------------------------------------------------------------------------

### I. Cockpit
#### A. Installation des dépendances
```bash
clear;
apt update >/dev/null;
apt install -y build-essential 1>/dev/null;
apt install -y git             1>/dev/null;
apt install -y make            1>/dev/null;
apt install -y nfs-common      1>/dev/null;
apt install -y realmd          1>/dev/null;
apt install -y tuned           1>/dev/null;
apt install -y udisks2-lvm2    1>/dev/null;
apt install -y -f;
```

#### B. Installation de Cockpit ([CERTIFICAT](https://infotechys.com/install-ssl-certificates-on-cockpit/))
##### 1. Cockpit
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit 1>/dev/null;
```

##### 2. Autoriser Root
```
sed -i -e "s/root/#root/g" /etc/cockpit/disallowed-users;
```

##### 3. Relance du service
```bash
systemctl restart cockpit.service;
```


#### C. Extension (Dépôt)
##### 1. 389-DS
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-389-ds 1>/dev/null;
```

##### 2. Bridge
Permet la création, gestion des ponts sous Linux.
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-bridge 1>/dev/null;
```

##### 3. Doc
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-doc 1>/dev/null;
```

##### 4. Machines
Permet l'ajout de la gestion des Machines-virtuelles sous Cockpit.
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-machines 1>/dev/null;
```

##### 5. Networking
Les interfaces gérées par le service linux `networking` n'est pas gérer par NetworkManager.

Il est conçu pour interagir avec NetworkManager, pas avec le service networking !

```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-networkmanager 1>/dev/null;
```

##### 6. Packagekit
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-packagekit 1>/dev/null;
```

##### 7. PCP
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-pcp 1>/dev/null;
```

##### 8. Podman
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-podman         1>/dev/null;
```

##### 9. SOS Report
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-sosreport      1>/dev/null;
```

##### 10. Storage
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-storaged       1>/dev/null;
```

##### 11. System
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-system         1>/dev/null;
```

##### 12. Tests
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-tests          1>/dev/null;
```

##### 13. WS
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit-ws             1>/dev/null;
```

#### D. Extensions (Externe)
```bash
clear;
# ============================================================================================================================================================================
COCKPIT_NAVIGATOR="https://github.com/45Drives/cockpit-navigator.git"
git clone $COCKPIT_NAVIGATOR /tmp/cockpit-navigator 2>/dev/null; cd /tmp/cockpit-navigator 1>/dev/null; make install;
# ============================================================================================================================================================================
COCKPIT_FILE_SHARE="https://github.com/45Drives/cockpit-file-sharing/releases/download/v3.2.9/cockpit-file-sharing_3.2.9-2focal_all.deb"
wget $COCKPIT_FILE_SHARE -O /tmp/cockpit-file-sharing.deb 2>/dev/null; apt install -y /tmp/cockpit-file-sharing.deb 1>/dev/null;
# ============================================================================================================================================================================
COCKPIT_IDENTITIES="https://github.com/45Drives/cockpit-identities/releases/download/v0.1.12/cockpit-identities_0.1.12-1focal_all.deb"
wget $COCKPIT_IDENTITIES -O /tmp/cockpit-identities.deb   2>/dev/null; apt install -y /tmp/cockpit-identities.deb   1>/dev/null;
```

#### F. Accéder au panel d'administration
Le panel d'administration de Cockpit est sur le port `9090` en `HTTPS`.

```bash
clear;
IP=$(ip add | grep "2: " -A2 | grep inet | cut -c 10-25 |cut -d "/" -f 1)
echo "Le panel d'administration est accesible à l'adresse https://$IP:9090"
```

#### G. Désinstallation des paquets
```bash
clear;
PACKAGES=$(apt search ^cockpit | grep "/" | grep "installé" | cut -d "/" -f 1 | xargs -n 50)
apt remove --purge $PACKAGES;
rm -r /etc/cockpit/;
```


#### H. LXC
Il est nécessaire d'avoir la fonctionnalité `Nesting` activé pour que le service fonctionne.




<br />
