-------------------------------------------------------------------------------------------------------
# <p align='center'> Préparation de l'environnement pour la compilation </p>

-------------------------------------------------------------------------------------------------------
## I. Installation des dépendances
Pour Debian 12 (Bookworm), voici la liste de paquets mise à jour pour compiler le noyau Linux :

### A. Paquets de base
- **build-essential** : fournit les outils de base pour la compilation, tels que gcc, make, etc.
- **libncurses6-dev** : fournit les bibliothèques de développement pour les interfaces utilisateur en mode texte
- **libssl-dev**      : fournit les bibliothèques de développement pour les fonctionnalités de sécurité SSL/TLS
- **libelf-dev**      : fournit les bibliothèques de développement pour les fichiers ELF (Executable and Linkable Format)

<br />

### B. Paquets pour la compilation du noyau
- **linux-headers-W.X.X-Z-amd64** : fournit les en-têtes de noyau pour la version actuelle du noyau
- **linux-source-W.X.X-Z-amd64**  : fournit le code source du noyau pour la version actuelle du noyau
- **libgcc-X.X-dev**              : fournit les bibliothèques de développement pour la version actuelle de GCC

<br />

### C. Paquets pour les dépendances du noyau
- **libpci-dev**       : fournit les bibliothèques de développement pour les périphériques PCI
- **libusb-dev**       : fournit les bibliothèques de développement pour les périphériques USB
- **libieee1275-dev**  : fournit les bibliothèques de développement pour les périphériques IEEE 1275 (Open Firmware)
- **libdevmapper-dev** : fournit les bibliothèques de développement pour les gestionnaires de disques logiques (LVM, etc.)

<br />

### D. Paquets pour les outils de développement
- **git**         : fournit le système de gestion de version Git
- **fakeroot**    : fournit un environnement de compilation avec des droits d'accès élevés
- **ncurses-dev** : fournit les bibliothèques de développement pour les interfaces utilisateur en mode texte
- **libqt4-dev**  : fournit les fichiers d'en-tête et les bibliothèques statiques nécessaires pour compiler des applications qui utilisent la bibliothèque Qt 4.

<br />

### E. Paquets pour les dépendances spécifiques
- **libcrypto-dev** : fournit les bibliothèques de développement pour les fonctionnalités de cryptographie
- **libz-dev**      : fournit les bibliothèques de développement pour la compression de données
- **liblz4-dev**    : fournit les bibliothèques de développement pour la compression de données LZ4
- **liblzma-dev**   : fournit les bibliothèques de développement pour la compression de données LZMA
- **libbpf-dev**    : fournit les bibliothèques de développement pour les programmes de filtrage de paquets (BPF)

<br />

### E. Installer les paquets
```bash
clear;
apt-get update 1>/dev/null;
apt install -y build-essential 1>/dev/null;
apt install -y fakeroot 1>/dev/null;
apt install -y git 1>/dev/null;

apt install -y libbpf-dev 1>/dev/null;
apt install -y libelf-dev 1>/dev/null;
apt install -y libcrypto++-dev 1>/dev/null;
apt install -y libdevmapper-dev 1>/dev/null;
apt install -y libgcc-$(gcc -v 2>&1 | grep '^gcc version' | cut -d' ' -f3 | cut -d "." -f 1)-dev 1>/dev/null;

apt install -y libglade2-dev 1>/dev/null;
apt install -y libgtk2.0-dev 1>/dev/null;

apt install -y libieee1284-3-dev 1>/dev/null;
apt install -y liblz4-dev 1>/dev/null;
apt install -y liblzma-dev 1>/dev/null;
apt install -y libncurses-dev  1>/dev/null;
apt install -y libqt4-dev 1>/dev/null;
apt install -y libpci-dev 1>/dev/null;
apt install -y libssl-dev 1>/dev/null;
apt install -y libusb-dev 1>/dev/null;
apt install -y libz-dev 1>/dev/null;
apt install -y linux-headers-$(uname -r) 1>/dev/null;
apt install -y linux-source-$(uname -r | cut -d "." -f 1-2) 1>/dev/null;
apt install -y ncurses-dev 1>/dev/null;
```

<br />

### F. Dépendance
```bash
# Requis si variable DEBUG_INFO_BTF = Y
apt install -y pahole;
```


<br />
