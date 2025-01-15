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
## II. Création d'un template

