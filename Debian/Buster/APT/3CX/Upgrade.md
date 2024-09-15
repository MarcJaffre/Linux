---------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Montée de version Debian pour 3CX </p>
---------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Mise à niveau vers Bullseye
### A. Définir les dépôt Bullseye 
```bash
clear;
source /etc/os-release;
cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian bullseye main
EOF
sed -i -e "s/$VERSION_CODENAME/bullseye/g" /etc/apt/sources.list.d/3cxpbx*.list;
```


### B. Mise à jour
```bash
clear;
apt update;
apt dist-upgrade -y;
apt autoremove   -y;
```

### C. Reboot
Il sera nécessaire de redémarre la machine après la mise à niveau
```bash
clear;
reboot;
```

### D. Vérification de la Release
```bash
clear;
lsb_release -a;
```

### E. Avertissement
La version 11 de PostgreSQL est obsolète, mais le paquet du client ou du serveur est toujours installé.
```
- Veuillez installer la version la plus récente des paquets postgresql-13 et postgresql-client-13 et mettre à niveau les grappes (« clusters ») en version  avec « pg_upgradecluster ».

- Veuillez noter que l'installation de postgresql-13 créera par défaut une grappe (« cluster ») 13/main. 
  Si vous souhaitez mettre à niveau la grappe 11/main, il faudra supprimer la grappe 13 en exécutant la commande « pg_dropcluster--stop 13 main ».

- Les anciennes versions des paquets client et serveur ne sont plus maintenues.
- Après la mise à niveau des grappes (« clusters »), les paquets postgresql-11 et postgresql-client-11 devraient être supprimés.            
```

```bash
root@3cx:~# pg_lsclusters
# Ver Cluster Port Status Owner    Data directory              Log file
# 11  main    5432 online postgres /var/lib/postgresql/11/main /var/log/postgresql/postgresql-11-main.log
# 13  main    5433 online postgres /var/lib/postgresql/13/main /var/log/postgresql/postgresql-13-main.log
# pg_dropcluster --stop 13 main
# pg_upgradecluster 11 main
```


<br />
<br />
<br />
<br />
<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Mise à niveau vers Bookworm
### A. Dépôt Bookworm pour Debian
```bash
clear;
source /etc/os-release;
cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian bookworm main
EOF
sed -i -e "s/$VERSION_CODENAME/bookworm/g" /etc/apt/sources.list.d/3cxpbx*.list;
```

### B. Mise à jour
Il sera nécessaire de redémarre la machine après la mise à niveau
```bash
clear;
apt update;
apt dist-upgrade -y;
apt autoremove   -y;
```


### C. Reboot
Il sera nécessaire de redémarre la machine après la mise à niveau
```bash
clear;
reboot;
```

### D. Vérification de la Release
```bash
clear;
lsb_release -a;
```

<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Mise à jour de 3CX
### A. Installation de 3CX pour Bookworm ([GIT](https://gist.github.com/amanjuman/d3703ec1c8bf6a5d9fe286d4a0620698))
```bash
clear;
rm /etc/apt/sources.list.d/3cx*.list;
wget -O- https://repo.3cx.com/key.pub | gpg --dearmor | sudo tee /usr/share/keyrings/3cx-archive-keyring.gpg >> /dev/null
echo "deb [arch=amd64 by-hash=yes signed-by=/usr/share/keyrings/3cx-archive-keyring.gpg] http://repo.3cx.com/3cx bookworm main" | tee /etc/apt/sources.list.d/3cxpbx.list
echo "deb [arch=amd64 by-hash=yes signed-by=/usr/share/keyrings/3cx-archive-keyring.gpg] http://repo.3cx.com/3cx bookworm-testing main" | tee /etc/apt/sources.list.d/3cxpbx.list
apt update -y
apt upgrade -y --with-new-pkgs
apt dist-upgrade -y
apt autoremove -y
apt-cache policy 3cxpbx
apt-get install 3cxpbx=20.0.0.827
/usr/sbin/3CXWizard --cleanup
apt install -y 3cxsbc
```

### B. Tips
Dans le panel Web, la mise à jour Debian 10 vers 12 lance la commande suivante
```
/usr/sbin/3CXUpgradeDebian10;
```
```
/var/lib/3cxpbx/Instance1/Data/Backups/
```
