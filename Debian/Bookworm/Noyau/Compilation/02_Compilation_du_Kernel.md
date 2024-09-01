--------------------------------------------------------------------------------------
# <p align='center'> Compilation du Noyau </p>

# <p align='center'>  Expiremental </p>

--------------------------------------------------------------------------------------
## I. Construction du Noyau
Il est nécessaire d'avoir 25 Go.

### A. Preparation Environnement du Noyau
``` bash
clear;
BRANCHE="6"
VERSION="$BRANCHE.10.7"
cd /Data;
rm -r linux-${VERSION}* 2>/dev/null
wget https://cdn.kernel.org/pub/linux/kernel/v${BRANCHE}.x/linux-${VERSION}.tar.xz 2>/dev/null;
tar -xf linux-${VERSION}.tar.xz;
cd linux-${VERSION};
```

<br />

### B. Menu de configuration
Touche Z permet d'afficher le menu caché
```bash
clear;
make menuconfig;
```

<br />

### C. Compilation en Multi-Core
#### 1. Sans CheckPoint
Si on souhaite `X` Core, il suffit de remplacer `$(nproc)` par le nombre de core qui compilerons.
```
-O3 pour activer l'optimisation du code en utilisant le cache L2 et L3. 
-O2 pour activer l'optimisation du code
-march=native pour compiler pour l'architecture native du processeur
-mtune=native pour ajuster les paramètres de compilation pour l'architecture native du processeur
```

```bash
#make -j$(nproc) ARCH=$(arch);
make -j$(nproc) -O3 -march=native -mtune=native > build.log 2>&1;
```

#### 2. CheckPoint
Permet la reprise de la compilation
```bash
clear;
make -j$(nproc) -O3 -march=native -mtune=native > build.log 2>&1 checkpoint;
make -j$(nproc) -O3 -march=native -mtune=native > build.log 2>&1 checkpoint-restore;
``` 

<br />

### D. Installer les modules
```bash
make modules_install;
```

<br />

### E. Installer le Noyau
```bash
clear;
SOURCE="/Data/linux-*/arch/x86_64/boot"
KERNEL_NAME="vmlinuz-marc"
cp $SOURCE/bzImage /boot/$KERNEL_NAME;
```

### E. Installer le Noyau
```bash
clear;
sudo cp /usr/src/linux/arch/<architecture>/boot/bzImage /boot/vmlinuz-<version>
cp /Data/linux-*/arch/x86_64/boot/bzImage /boot/vmlinuz-marc;
update-grub
```



### F. Durée de compilation

```
Démarrage: 7h30
```
