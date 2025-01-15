------------------------------------------------------------------------------------------------------
# <p align='center'> Construction d'un template LXC sur Proxmox </p>
------------------------------------------------------------------------------------------------------
## I. Présentation
### A. Stockage
Le nom du stockage est `Local`.

### B. Mise à jour de la liste des templates
```bash
clear;
pveam  update;
```

### C. Lister les OS Templates
```bash
clear;
pveam available --section  system
```

### D. Télécharger un OS Template
```bash
clear;
pveam download local debian-12-standard_12.7-1_amd64.tar.zst;
```
