------------------------------------------------------------------------------------------------------
# <p align='center'> Construction d'un template LXC sur Proxmox </p>
------------------------------------------------------------------------------------------------------
## I. Présentation de base
### A. Stockage
Le nom du stockage est `Local`.

### B. Mise à jour de la liste des templates
```bash
clear;
pveam update;
```

### C. Afficher la liste des OS Templates disponibles
```bash
clear;
pveam available --section system;
```

### D. Télécharger un OS Template
```bash
clear;
pveam download local debian-12-standard_12.7-1_amd64.tar.zst;
```

### E. Lister les templates sur la machines
```bash
clear;
pveam list local;
```

### F. Supprimer un template
```bash
clear;
pveam remove local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst;
```

<br />

------------------------------------------------------------------------------------------------------
## II. Création de conteneur

### A. Arrêter le conteneur
```bash
clear;
pct stop 999 2>/dev/null;
```

### B. Supprimer un conteneur
```bash
clear;
pct destroy 999 2>/dev/null;
```
### C. Création d'un conteneur LXC ([DOC](https://pve.proxmox.com/pve-docs/pct.1.html))
Création d'un conteneur sous Debian, 2 Core, 1 Go, 512 Mo Swap et 15 Go de stockage.
```bash
clear;
pct create 999 \
local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst \
--timezone Europe/Paris \
--pool 100.LXC \
--storage Data \
--rootfs Data:15 \
--ostype debian \
--hostname Debian \
--cores 2 \
--memory 1024 \
--swap 512 \
--password admin \
--net0 name=eth0,bridge=vmbr0,ip=192.168.0.220/24,firewall=0,gw=192.168.0.1,type=veth \
--searchdomain lan.home \
--nameserver 8.8.8.8 \
--template 0 \
--unprivileged 0 \
--features keyctl=1,nesting=1,mount="nfs;cifs",fuse=1,mknod=1;
```

```
# --mp0 volume=/dev/sdc1,mp=/mnt/media,acl=0,backup=0,quota=0,replicate=0,ro=0,shared=0 
# --features
# keyctl=1,
# nesting=1,
# mount="nfs;cifs",
# fuse=1,
# mknod=1,
# force_rw_sys=1
```




### C. Démarrer le conteneur
```bash
clear;
pct start 999;
```


### E. Etat le conteneur
```bash
clear;
pct status 999;
```

------------------------------------------------------------------------------------------------------
## III. Personnalisation du conteneur
### A. Se connecter au conteneur
```bash
clear;
pct enter 999;
```

### B. Remote Command
#### 1. Création d'un script
```bash
clear;
pct exec 999 -- bash -c 'cat > install.sh << EOF
#!/usr/bin/bash
apt update;
apt upgrade -y;
sed -i -e "s/\#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config;
systemctl restart ssh;
EOF'
```

#### 2. Modification des permissions
```bash
clear;
pct exec 999 -- bash -c 'chmod +x /root/install.sh'
```
#### 3. Lancement du script
```bash
clear;
pct exec 999 -- bash -c '/root/install.sh'
```

