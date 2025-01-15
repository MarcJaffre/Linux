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
### A. Création d'un conteneur LXC ([DOC](https://pve.proxmox.com/pve-docs/pct.1.html))
Création d'un conteneur sous Debian, 2 Core, 1 Go, 512 Mo Swap et 15 Go de stockage.
```bash
clear;
pct destroy 103 2>/dev/null;
pct create 103 local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst \
--pool 100.LXC \
--rootfs volume=Data:15 \
--ostype alpine \
--hostname Alpine \
--cores 2 \
--memory 1024 \
--swap 512 \
--password admin \
--net0 name=eth0,bridge=vmbr0,firewall=0,link_down=0,gw=192.168.0.1,ip=192.168.0.220/24 \
--searchdomain lan.home \
--nameserver 8.8.8.8 \
--unprivileged=0 \
--features keyctl=1,nesting=1,mount="nfs;cifs",fuse=1,mknod=1 

# keyctl=1,
# nesting=1,
# mount="nfs;cifs",
# fuse=1,
# mknod=1,
# force_rw_sys=1
```


### B. Supprimer un conteneur
```bash
clear;
pct destroy 103;
```

### C. Démarrer le conteneur
```bash
clear;
pct start 103;
```

### D. Arrêter le conteneur
```bash
clear;
pct stop 103;
```

### E. Etat le conteneur
```bash
clear;
pct status 103;
```
