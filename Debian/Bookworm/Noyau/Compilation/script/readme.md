### Note ([Doc](https://www.kernel.org/doc/html/v5.3/process/applying-patches.html#applying-patches))

https://www.youtube.com/watch?v=WfvA2RRzRWA

#### A. Télécharger (Kernel + patch)  - 1/06/2027
https://www.kernel.org/doc/html/v6.1/kbuild/kbuild.html

```bash
#!/usr/bin/bash
clear;
# ==============================================================================
DOSSIER=/Data
# ==============================================================================
# Remove Folder
if [ -d $DOSSIER ]; then
 cd $HOME;
 rm -r $DOSSIER 2>/dev/null;
fi
# ==============================================================================
# Make Folder
if [ ! -d $DOSSIER ]; then
 mkdir -p $DOSSIER;
 cd       $DOSSIER;
fi
# ==============================================================================
# Download
wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.0.tar.xz;
wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.0.2.tar.xz;
wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/patch-7.0.1.xz;
wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/patch-7.0.2.xz;
wget -q https://cdn.kernel.org/pub/linux/kernel/v7.x/patch-7.0.3.xz;
# ==============================================================================
# Extract
tar -xf linux-7.0.tar.xz;
tar -xf linux-7.0.2.tar.xz;
xz -d patch-7.0.1.xz;
xz -d patch-7.0.2.xz;
#xz -d patch-7.0.3.xz;
# ==============================================================================
# Kernel Folder
#cd linux-7.0.2;
# ==============================================================================
# Check Version
#make kernelversion;
# ==============================================================================
# Reverse patch to 7.0.0 + Upgrade at 7.0.3
#patch -s -R -p1 < ../patch-7.0.2; make kernelversion;
#patch -s -p1    < ../patch-7.0.3; make kernelversion;
# ==============================================================================
# Clean Kernel
#make clean;
# ==============================================================================
# Import Config kernel
#rm .config 2>/dev/null;
#cp /boot/config-$(uname -r) .config;
#make menuconfig;
#make kernelversion;
# ==============================================================================
# Build Kernel
#make debuginfo=no -j$(nproc) all;
# ==============================================================================
# Install
#make modules_install;
#make install;
# ==============================================================================
#make bindeb-pkg; #dpkg -i ./linux-image-7.0.0.deb;
# ==============================================================================
```

<br />

#### B. kernel non-vanilla vers supérieur
On a le kernel 7.0.2 et on souhaite le kernel 7.0.3. Il faut downgrade pour être sur le kernel vanilla puis patché 7.0.3
```bash
clear;
cd $DOSSIER/test/linux-7.0.2;
make kernelversion;
patch -s -R -p1 < ../patch-7.0.2; make kernelversion;
patch -s -p1    < ../patch-7.0.3; make kernelversion;
```

<br />

#### C. Kernel Vanilla vers supérieur
```bash
clear;
cd $DOSSIER/test/linux-7.0;
make kernelversion;
patch -s -p1    < ../patch-7.0.1; make kernelversion;
patch -s -R -p1 < ../patch-7.0.1; make kernelversion;
```

<br />

#### D. Nettoyer
```bash
clear;
make clean;
```

<br />

#### E. Personnalisé
```bash
clear;
rm .config 2>/dev/null;
cp /boot/config-$(uname -r) .config;
make menuconfig;
make kernelversion;
```

<br />

#### F. Compiler
```bash
clear;
make debuginfo=no -j$(nproc) all; # Retirer le mode debug
make -j$(nproc) all;
```

<br />

#### G. Génération Deb
```bash
clear;
make bindeb-pkg
dpkg -i ./linux-image-7.0.0.deb
```

<br />

#### X. Installer
```bash
clear;
make modules_install;
make install;
```



#### X. Kbuild
La documentation [KBUILD](https://www.kernel.org/doc/html/v6.1/kbuild/kbuild.html) concerne les options : INSTALL_MOD_STRIP
