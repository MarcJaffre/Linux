--------------------------------------------------------------------------------------
# <p align='center'> Compilation du Noyau (EXPIRMENTAL) </p>

--------------------------------------------------------------------------------------
## I. Construction du Noyau
### A. Preparation Environnement du Noyau
``` bash
clear;
BRANCHE="6"
VERSION="$BRANCHE.10.7"
rm -r linux-${VERSION}* 2>/dev/null
wget https://cdn.kernel.org/pub/linux/kernel/v${BRANCHE}.x/linux-${VERSION}.tar.xz 2>/dev/null;
tar -xvf linux-${VERSION}.tar.xz;
```
