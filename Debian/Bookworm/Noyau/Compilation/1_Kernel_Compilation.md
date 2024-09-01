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

### B. Menu de configuration
Touche Z permet d'afficher le menu caché
```bash
clear;
make menuconfig;
```

### C. Compilation en Multi-Core
Si on souhaite `X` Core, il suffit de remplacer `$(nproc)` par le nombre de core qui compilerons.
```bash
make ARCH=$(arch) -j$(nproc)  CONFIG_DEBUG_INFO_BTF=n;
```


### D. Installer les modules
```bash
make modules_install;
```

### E. Installer le Noyau
```bash
make install;
```

### F. Durée de compilation

```
Démarrage: 5H10
```
