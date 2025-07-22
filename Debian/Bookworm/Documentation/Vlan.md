--------------------------------------------------------------------------------
# <p align='center'> Installation et configuration d'un VLAN sous Debian </p>

--------------------------------------------------------------------------------
## I. Base
### A. Présentation
### B. Installation du paquet
```bash
clear;
apt install vlan;
```
### C. Gestion du Module Vlan
Activer le module `8021q` au démarrage du système et lancer à chaud le module pour ne pas avoir redémarrer la machine.
```bash
clear;
echo "8021q" >> /etc/modules;
modprobe 8021q;
```

### D. Network
```bash
clear;
```
