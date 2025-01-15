------------------------------------------------------------------------------------------------------
# <p align='center'> Création d'un conteneur et personnalisation </p>
------------------------------------------------------------------------------------------------------
## I. Création de conteneur
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
Création d'un conteneur sous Debian, 2 Core, 1 Go, 512 Mo Swap et 4 Go de stockage.
```bash
clear;
pct create 999 \
local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst \
--timezone Europe/Paris \
--pool 100.LXC \
--storage Data \
--rootfs Data:4 \
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

### D. Démarrer le conteneur
```bash
clear;
pct start 999;
```

### E. Etat le conteneur
```bash
clear;
pct status 999;
```
