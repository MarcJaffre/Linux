------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation OpenMediaVault </p>
------------------------------------------------------------------------------------------------------------------------
## I. Installation de l'application
### A. Dépendances
```bash
clear;
apt install --yes gnupg;
```

### B. Source OpenMediaVault
#### 1. Clé GPG
```bash
clear;
wget --quiet --output-document=- https://packages.openmediavault.org/public/archive.key | gpg --dearmor --yes --output "/usr/share/keyrings/openmediavault-archive-keyring.gpg"
```
#### 2. Dépôt
```bash
clear;
cat > /etc/apt/sources.list.d/openmediavault.list << EOF 
deb [signed-by=/usr/share/keyrings/openmediavault-archive-keyring.gpg] https://packages.openmediavault.org/public sandworm main
EOF
```

### B. Installation du paquet
```bash
clear;
export LANG=C.UTF-8;
export DEBIAN_FRONTEND=noninteractive;
export APT_LISTCHANGES_FRONTEND=none;
apt update;
apt --yes --auto-remove --show-upgraded --allow-downgrades --allow-change-held-packages --no-install-recommends --option DPkg::Options::="--force-confdef" --option DPkg::Options::="--force-confold" install openmediavault;
```

### C. Mise en service
```bash
clear;
omv-confdbadm populate;
omv-salt deploy run systemd-networkd;
```

### D. Suppléments
#### 1. Extras
```bash
clear;
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/packages/raw/master/install | bash
```

#### 2. ADD-ONS
```bash
clear;
apt install -y openmediavault-compose;
apt install -y openmediavault-cputemp;
apt install -y openmediavault-diskstats;
apt install -y openmediavault-locate;
apt install -y openmediavault-lvm2;
apt install -y openmediavault-md;
apt install -y openmediavault-omvextrasorg;
apt install -y openmediavault-remotemount;
apt install -y openmediavault-resetperms;
```
