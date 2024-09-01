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

KERNEL_COMPILATION(){}

KERNEL_INSTALL_MODULE(){}

KERNEL_COPY(){}

KERNEL_UPDATE_GRUB(){}

KERNEL_UNINSTALL_MODULE(){}

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
  KERNEL_INSTALL_MODULE;
  KERNEL_COPY;
  KERNEL_UPDATE_GRUB;
  ;;
 # ====================================
 uninstall)
  KERNEL_UNINSTALL_MODULE;
  ;;
 # ====================================
 *)
  GUIDE;
  ;;
esac
