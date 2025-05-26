----------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation d'un serveur de fichier </p>
----------------------------------------------------------------------------------------------------------------------------
## I. Déploiement de Samba
### A. Paquets
```bash
apt install samba;
apt install samba-common;
```

### B. Gestion du service
```bash
systemctl stop    samba;
systemctl start   samba;
systemctl restart samba;
systemctl disable samba;
systemctl enable  samba;
```

### C. WSDD
Permet au poste client de découvrir les partages.
```bash
clear;
apt install --no-install-recommends wsdd;
```
