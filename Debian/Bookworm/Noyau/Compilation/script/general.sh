#!/usr/bin/bash

######################################################################################################################################################
# Chargement Configuration #
############################
source settings;

######################################################################################################################################################
# Fonctions #
#############
KERNEL_PURGE(){
 cd $DOSSIER;
 rm -rf $DOSSIER/linux-${VERSION}* 2>/dev/null;
}

DOWNLOAD_KERNEL(){
 cd $DOSSIER;
 wget $KERNEL $DOSSIER/linux-${VERSION}.tar.xz             2>/dev/null;
 tar xf       $DOSSIER/linux-${VERSION}.tar.xz -C $DOSSIER 1>/dev/null;
}

KERNEL_EDIT(){
 cd $DOSSIER/linux-${VERSION};
 make xconfig;
}

KERNEL_CLEAN(){
 cd $DOSSIER/linux-${VERSION};
 make clean;
}

KERNEL_COMPILATION(){
 cd $DOSSIER/linux-${VERSION};
 make -j$(nproc) ARCH=$(arch);
}

INSTALL_SYSTEM_MODULE(){
 cd $DOSSIER/linux-${VERSION};
 make modules_install;
}

INSTALL_SYSTEM_KERNEL(){
cp $DOSSIER/linux-${VERSION}/arch/$(uname -m)/boot/bzImage /boot/vmlinuz-custom;
}

INSTALL_SYSTEM_UPDATE_GRUB(){
 update-grub;
}

UNINSTALL_NEW_KERNEL(){
 rm -rf /lib/modules/${VERSION};
 rm -rf /boot/vmlinuz-custom;
}

GUIDE(){}

######################################################################################################################################################
# Conditionnement #
###################
case $1 in
 # ====================================
 purge)
  KERNEL_PURGE;
  ;;
 # ====================================
 download)
  DOWNLOAD_KERNEL;
  ;;
 # ====================================
 edit)
  KERNEL_EDIT;
  ;;
 # ====================================
 clean)
  KERNEL_CLEAN
  ;;
 # ====================================
 compilation)
  KERNEL_COMPILATION;
  ;;
 # ====================================
 install)
  INSTALL_SYSTEM_MODULE;
  INSTALL_SYSTEM_KERNEL;
  INSTALL_SYSTEM_UPDATE_GRUB;
  ;;
 # ====================================
 uninstall)
  UNINSTALL_NEW_KERNEL;
  ;;
 # ====================================
 *)
  GUIDE;
  ;;
esac
