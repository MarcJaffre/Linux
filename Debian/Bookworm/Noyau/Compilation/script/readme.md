### Note ([Doc](https://www.kernel.org/doc/html/v5.3/process/applying-patches.html#applying-patches))
#### A. Télécharger (Kernel + patch) 
```bash
clear;

DOSSIER=/Data

# ==============================================================================
cd    $DOSSIER;
rm -r $DOSSIER/test/ 2>/dev/null;
mkdir $DOSSIER/test/ 2>/dev/null;
cd    $DOSSIER/test/ 2>/dev/null;

# ==============================================================================
wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.0.tar.xz;
wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.0.2.tar.xz;
wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/patch-7.0.1.xz;
wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/patch-7.0.2.xz;
wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/patch-7.0.3.xz;

# ==============================================================================
tar -xf linux-7.0.tar.xz;
tar -xf linux-7.0.2.tar.xz;

# ==============================================================================
xz -d patch-7.0.1.xz;
xz -d patch-7.0.2.xz;
xz -d patch-7.0.3.xz;
# ==============================================================================
```


#### B. Kernel Vanilla vers supérieur
```bash
clear;
cd $DOSSIER/test/linux-7.0;
make kernelversion;
patch -s -p1    < ../patch-7.0.1; make kernelversion;
patch -s -R -p1 < ../patch-7.0.1; make kernelversion;
```

#### C. kernel non-vanilla vers supérieur
On a le kernel 7.0.2 et on souhaite le kernel 7.0.3. Il faut downgrade pour être sur le kernel vanilla puis patché 7.0.3
```bash
clear;
cd $DOSSIER/test/linux-7.0.2;
make kernelversion;
patch -s -R -p1 < ../patch-7.0.2; make kernelversion;
patch -s -p1    < ../patch-7.0.3; make kernelversion;
```

#### D. Nettoyer
```bash
clear;
make clean;
```

#### E. Personnalisé
```bash
clear;
rm .config 2>/dev/null;
cp /boot/config-$(uname -r) .config;
make menuconfig;
```

#### F. Compiler
```bash
clear;
make debuginfo=no -j$(nproc) all; # Retirer le mode debug
make -j$(nproc) all;
```

#### G. Installer
```bash
clear;
make modules_install;
make install;
```
