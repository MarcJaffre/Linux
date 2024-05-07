------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Personnalisation du Noyau Linux </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Avertissement
Ce guide est pas pour les débutants mais pour les confirmés.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Préparation de l'environnement
#### A. Installation des dépendances
Pour permettre la construction du Noyaux Linux, il est important d'installer les dépendances pour permettre sa construction.

```bash
apt install -y build-essential
apt install -y bc
apt install -y bison
apt install -y fakeroot
apt install -y flex
apt install -y git
apt install -y libelf-dev
apt install -y libssl-dev
apt install -y ncurses-dev
apt install -y xz-utils
```

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Compiler le Noyaux
#### A. Télécharger le Noyau (Kernel.org)
```bash
clear;
VERSION=6
RELEASE=8.9
rm -r linux-${VERSION}.${RELEASE} 2>/dev/null
wget https://cdn.kernel.org/pub/linux/kernel/v${VERSION}.x/linux-${VERSION}.${RELEASE}.tar.xz -O /tmp/kernel-${VERSION}.${RELEASE}.tar.xz;
```
#### B. Extraire le fichier Compresser
```bash
clear;
tar -xvf /tmp/kernel-${VERSION}.${RELEASE}.tar.xz -C /root;
```

#### C. Configurer le Noyau
```bash
clear;
make menuconfig;
```










------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#### IV. Sources et liens utiles
```
- https://www.malekal.com/comment-compiler-noyau-linux/
- https://www.kernel.org/doc/html/latest/kbuild/kbuild.html
```


