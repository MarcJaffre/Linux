------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de Cockpit </p>

### X. Cockpit
#### X. Installation des dépendances
```bash
clear;
apt install -y build-essential 1>/dev/null;
apt install -y git             1>/dev/null;
apt install -y make            1>/dev/null;
apt install -y nfs-common      1>/dev/null;
apt install -y realmd          1>/dev/null;
apt install -y tuned           1>/dev/null;
apt install -y udisks2-lvm2    1>/dev/null;
```

#### X. Installation de Cockpit ([CERTIFICAT](https://infotechys.com/install-ssl-certificates-on-cockpit/))
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
#apt install -y cockpit-ws            1>/dev/null;
```

#### X. Démarrage du service
```bash
systemctl restart cockpit.service;
```

#### X. Extensions
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



<br />
