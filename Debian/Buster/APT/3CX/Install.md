---------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Déploiement de 3CX </p>

---------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Installation
### A. Création d'un compte 3CX
### B. Auto-Hebergement
#### 1. Dependance
```bash
clear;
apt install -y dphys-swapfile;
apt install -y gnupg2;
apt install -y net-tools;
```
#### 2. Installation
```bash
clear;
wget -O- http://downloads-global.3cx.com/downloads/3cxpbx/public.key    | apt-key add -
echo "deb http://downloads-global.3cx.com/downloads/debian buster main" | tee /etc/apt/sources.list.d/3cxpbx.list;
apt-get update;
apt-get install 3cxpbx;
```
