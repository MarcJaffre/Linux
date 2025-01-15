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
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests cockpit                1>/dev/null;
apt install -y --no-install-recommends --no-install-suggests cockpit-bridge         1>/dev/null;
apt install -y --no-install-recommends --no-install-suggests cockpit-networkmanager 1>/dev/null;
apt install -y --no-install-recommends --no-install-suggests cockpit-packagekit     1>/dev/null;
apt install -y --no-install-recommends --no-install-suggests cockpit-storaged       1>/dev/null;
apt install -y --no-install-recommends --no-install-suggests cockpit-system         1>/dev/null;
apt install -y --no-install-recommends --no-install-suggests cockpit-ws             1>/dev/null;
```

```bash
clear;
apt install -y cockpit-machines       1>/dev/null;
apt install -y cockpit-pcp            1>/dev/null;
apt install -y cockpit-podman         1>/dev/null;
apt install -y cockpit-sosreport      1>/dev/null;
apt install -y cockpit-tests          1>/dev/null;
```

#### C. Extensions
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

#### D. Autoriser Root
```
sed -i -e "s/root/#root/g" /etc/cockpit/disallowed-users;
```


#### E. Relance du service
```bash
systemctl restart cockpit.service;
```

#### G. Accéder au panel d'administration
Le panel d'administration de Cockpit est sur le port `9090` en `HTTPS`.

```bash
clear;
IP=$(ip add | grep "2: " -A2 | grep inet | cut -c 10-25 |cut -d "/" -f 1)
echo "Le panel d'administration est accesible à l'adresse https://$IP:9090"
```

#### F. LXC
Il est nécessaire d'avoir la fonctionnalité `Nesting` activé pour que le service fonctionne.

<br />
