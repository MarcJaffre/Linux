--------------------------------------------------------------------------------------
# <p align='center'> Compilation du Noyau </p>

# <p align='center'>  Expiremental </p>


--------------------------------------------------------------------------------------
## I. Construction du Noyau
### A. Preparation Environnement du Noyau
``` bash
clear;
BRANCHE="6"
VERSION="$BRANCHE.10.7"
cd $HOME;
rm -r linux-${VERSION}* 2>/dev/null
wget https://cdn.kernel.org/pub/linux/kernel/v${BRANCHE}.x/linux-${VERSION}.tar.xz 2>/dev/null;
tar -xvf linux-${VERSION}.tar.xz;
cd linux-${VERSION}
```

### B. Menu de configuration
La configuration du Noyau se fera à la fin de la page
```bash
clear;
make menuconfig;
```

### C. Compilation en Multi-Core
Si on souhaite `X` Core, il suffit de remplacer `$(nproc)` par le nombre de core qui compilerons.
```bash
make -j $(nproc);
```
