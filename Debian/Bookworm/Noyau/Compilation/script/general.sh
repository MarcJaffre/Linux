#!/usr/bin/bash

######################################################################################################################################################
# Fonctions #
#############
KERNEL_PURGE(){}

DOWNLOAD_KERNEL(){}

KERNEL_EDIT(){}

KERNEL_CLEAN(){}

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
