### Note ([Doc](https://www.kernel.org/doc/html/v5.3/process/applying-patches.html#applying-patches))

https://www.youtube.com/watch?v=WfvA2RRzRWA

### A. Télécharger (Kernel + patch)  - 1/06/2027
https://www.kernel.org/doc/html/v6.1/kbuild/kbuild.html

```bash
#!/usr/bin/bash

# ====================================================================================================================
# nano build.sh; ./build.sh;

# ====================================================================================================================
# Clean console
#clear;

# ====================================================================================================================
# Kernel version target
#KERNEL_BASEURL="https://cdn.kernel.org/pub/linux/kernel"
#KERNEL_MAJEUR="7"
#KERNEL_MINEUR="0"
#KERNEL_CORRECTIF="9"

# ====================================================================================================================
# Workdir
#DOSSIER=/Data

# ====================================================================================================================
# Remove Folder
#if [ -d $DOSSIER ]; then
# cd     $HOME;
# rm -r  $DOSSIER;
#fi

# ====================================================================================================================
# Make Folder
#if [ ! -d $DOSSIER ]; then
# mkdir -p $DOSSIER;
# cd       $DOSSIER;
#fi

# ====================================================================================================================
# Download
#wget -q $KERNEL_BASEURL/v${KERNEL_MAJEUR}.x/linux-${KERNEL_MAJEUR}.0.tar.xz;
#wget -q $KERNEL_BASEURL/v${KERNEL_MAJEUR}.x/patch-${KERNEL_MAJEUR}.${KERNEL_MINEUR}.${KERNEL_CORRECTIF}.xz;

# ====================================================================================================================
# Extract tar file
#tar -xf linux-${KERNEL_MAJEUR}.0.tar.xz;

# ====================================================================================================================
# Extract xz file
#xz  -d  patch-${KERNEL_MAJEUR}.${KERNEL_MINEUR}.${KERNEL_CORRECTIF}.xz;

# ====================================================================================================================
# Kernel Folder
#cd linux-${KERNEL_MAJEUR}.0;

# ====================================================================================================================
# Check Version
#KERNEL_ORIGINAL=$(make kernelversion)

# ====================================================================================================================
# Apply Patch
#patch -s -p1    < ../patch-${KERNEL_MAJEUR}.${KERNEL_MINEUR}.${KERNEL_CORRECTIF};
#KERNEL_UPGRADE=$(make kernelversion)

# ====================================================================================================================
# Message
#echo "########################################################";
#echo "#                  KERNEL COMPILATION                  #";
#echo "########################################################";
#echo "# - Kernel original  version: $KERNEL_ORIGINAL                     ";
#echo "# - Kernel downgrade version: $KERNEL_DOWNGRADE                     ";
#echo "# - Kernel upgrade   version: $KERNEL_UPGRADE                     ";

# ====================================================================================================================
# Import Config kernel
#if [ -f .config ];then
#echo "# - Purge du fichier config                            #";
# rm .config 2>/dev/null;
# cp /boot/config-$(uname -r) .config;
#echo "# - Copie du fichier config                            #";
#else
# cp /boot/config-$(uname -r) .config;
#echo "# - Copie du fichier config                            #";
#fi

# ====================================================================================================================
# Clean Kernel (Inutile) - #make clean 2>/dev/null;

# ==============================================================================
# custom config
#make menuconfig;

# ====================================================================================================================
# Build Kernel
#make debuginfo=no -j$(nproc) all;

# ====================================================================================================================
# Install module
#make modules_install;

# ====================================================================================================================
# Install Kernel
#make install;

# ====================================================================================================================
# Build deb file
#make bindeb-pkg;

# ==============================================================================
# Install deb
#dpkg -i ./linux-image-${KERNEL_MAJEUR}.${KERNEL_MINEUR}.${KERNEL_CORRECTIF}.deb;

# ====================================================================================================================
```


<br />

### B. kernel non-vanilla vers supérieur
On a le kernel 7.0.2 et on souhaite le kernel 7.0.3. Il faut downgrade pour être sur le kernel vanilla puis patché 7.0.3
```bash
clear;
cd $DOSSIER/test/linux-7.0.2;
make kernelversion;
patch -s -R -p1 < ../patch-7.0.2; make kernelversion;
patch -s -p1    < ../patch-7.0.3; make kernelversion;
```

<br />

### C. Kernel Vanilla vers supérieur
```bash
clear;
cd $DOSSIER/test/linux-7.0;
make kernelversion;
patch -s -p1    < ../patch-7.0.1; make kernelversion;
patch -s -R -p1 < ../patch-7.0.1; make kernelversion;
```

<br />

### D. Nettoyer
```bash
clear;
make clean;
```

<br />

### E. Personnalisé
```bash
clear;
rm .config 2>/dev/null;
cp /boot/config-$(uname -r) .config;
make menuconfig;
make kernelversion;
```

<br />

### F. Compiler
```bash
clear;
make debuginfo=no -j$(nproc) all; # Retirer le mode debug
make -j$(nproc) all;
```

<br />

### G. Génération Deb
```bash
clear;
make bindeb-pkg
dpkg -i ./linux-image-7.0.0.deb;
```

<br />

### X. Installer
```bash
clear;
make modules_install;
make install;
```


### X. Désinstaller
```bash
clear;
rm /boot/config-7.0.0;
rm /boot/initrd.img-7.0.0;
rm /boot/System.map-7.0.0;
rm /boot/vmlinuz-7.0.0;
rm -r /lib/modules/7.0.0;
```

<br />

### X. Mettre à jour le démarrage
```bash
clear;
update-grub;
update-initramfs -u;
```




<br />

### X. Kbuild (Varriable)
La documentation [KBUILD](https://www.kernel.org/doc/html/v6.1/kbuild/kbuild.html) concerne les options : INSTALL_MOD_STRIP

#### 01. KCPPFLAGS
#### 02. KAFLAGS
#### 04. AFLAGS_MODULE
#### 05. AFLAGS_KERNEL
#### 06. KCFLAGS
#### 07. KRUSTFLAGS
#### 08. RUSTFLAGS_KERNEL
#### 09. CFLAGS_KERNEL
#### 10. CFLAGS_MODULE
#### 11. RUSTFLAGS_KERNEL
#### 12. RUSTFLAGS_MODULE
#### 13. LDFLAGS_MODULE
#### 14. HOSTCFLAGS
#### 15. HOSTCXXFLAGS
#### 16. HOSTRUSTFLAGS
#### 17. HOSTLDFLAGS
#### 18. HOSTLDLIBS
#### 19. USERCFLAGS
#### 20. USERLDFLAGS
#### 21. KBUILD_KCONFIG
#### 22. KBUILD_VERBOSE
#### 23. KBUILD_EXTMOD
#### 24. KBUILD_OUTPUT
#### 25. KBUILD_EXTRA_WARN
#### 26. KBUILD_DEBARCH
#### 27. ARCH
#### 28. CROSS_COMPILE
#### 29. CF
#### 30. INSTALL_PATH
#### 31. MODLIB
#### 32. INSTALL_MOD_PATH
#### 33. INSTALL_MOD_STRIP
#### 34. KBUILD_ABS_SRCTREE
#### 35. KBUILD_SIGN_PIN
#### 36. KBUILD_MODPOST_WARN
#### 37. KBUILD_MODPOST_NOFINAL
#### 38. KBUILD_EXTRA_SYMBOLS
#### 39. ALLSOURCE_ARCHS
#### 40. KBUILD_BUILD_TIMESTAMP
#### 41. KBUILD_BUILD_USER
#### 42. KBUILD_BUILD_HOST
#### 43. LLVM
