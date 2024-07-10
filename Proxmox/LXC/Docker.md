------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Déploiement de Docker sur un conteneur LXC </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Création du conteneur LXC
### A. Information sur le conteneur LXC
```
- Nom de la Machine      : Docker-LXC01
- Conteneur privilégié   : Non*
- Fonctionnalités        : Nesting
- Système d'exploitation : Debian 11/12
- Taille du stockage     : 8 Go
- Processeur(s)          : 2 Core(s)
- Mémoire-Vive           : 2 Go
- SWAP                   : 2 Go
- Carte-réseau           : eth0
- Nom du pont réseau     : vmbr0 (Réseau physique)
```

### B. Configuration réseau
```
- Adresse IPv4 (CIDR)    : 192.168.0.80/24
- Passerelle réseau      : 192.168.0.1
- Masque de Sous-réseau  : 255.255.255.0
- Adresse DNS            : 192.168.0.1
- Nom de domaine         : lan.local
```

### C. Mise à jour du Debian
#### 1. Configuration des dépôts
```bash
clear;
source /etc/os-release;
if [ $VERSION_CODENAME = bookworm ]; then
echo "deb http://deb.debian.org/debian bookworm          main contrib non-free non-free-firmware
deb http://deb.debian.org/debian bookworm-updates  main contrib non-free non-free-firmware
deb http://security.debian.org   bookworm-security main contrib non-free non-free-firmware" > /etc/apt/sources.list;
fi

if [ $VERSION_CODENAME = bullseye ]; then
echo "deb http://deb.debian.org/debian bullseye          main contrib non-free
deb http://deb.debian.org/debian bullseye-updates  main contrib non-free
deb http://security.debian.org   bullseye-security main contrib non-free" > /etc/apt/sources.list;
fi
apt update;
```

#### 2. Rechercher les mises à jours
```bash
clear;
apt update;
```

#### 3. Mise à niveau
```bash
clear;
apt upgrade;
```


<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Installation de Docker
### A. Installer les dépendances
```
clear;
apt install ca-certificates curl;
```

### B. Ajout des dépôts
```bash
clear;
install -m 0755 -d /etc/apt/keyrings;
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc;
chmod a+r /etc/apt/keyrings/docker.asc;
```



<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Déploiement de Portainer-CE



