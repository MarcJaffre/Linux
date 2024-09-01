#!/usr/bin/bash
######################################################################################################################################################
# Etat: En cours de conception du script
######################################################################################################################################################

######################################################################################################################################################
# Configuration #
#################
DOSSIER="/Data"
BRANCHE="6"
VERSION="$BRANCHE.10.7"
KERNEL="https://cdn.kernel.org/pub/linux/kernel/v${BRANCHE}.x/linux-${VERSION}.tar.xz"

######################################################################################################################################################
# Fonctions #
#############
KERNEL_PURGE(){
 cd $DOSSIER;
 rm -rf $DOSSIER/linux-${VERSION} 2>/dev/null;
}

DOWNLOAD_KERNEL(){
 cd $DOSSIER;
 if [ ! -f $DOSSIER/linux-${VERSION}.tar.xz ];then
   wget $KERNEL $DOSSIER/linux-${VERSION}.tar.xz             2>/dev/null;
   tar xf       $DOSSIER/linux-${VERSION}.tar.xz -C $DOSSIER 1>/dev/null;
   rm $KERNEL $DOSSIER/linux-${VERSION}.tar.xz;
 fi
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
 # =====================================
 START_DATE=$(date +'%Y/%m/%d')
 START_HORAIRE=$(date +'%H H %M')
 # =====================================
 cd $DOSSIER/linux-${VERSION};
 make -j$(nproc) ARCH=$(arch);
 # =====================================
 END_DATE=$(date +'%Y/%m/%d')
 END_HORAIRE=$(date +'%H H %M')
 # =====================================
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
 rm -rf /boot/vmlinuz-custom     2>/dev/null;
 rm -rf /boot/vmlinuz-${VERSION} 2>/dev/null;
 rm -rf /lib/modules/${VERSION}  2>/dev/null;
}

GUIDE(){
 echo "#############################################################################";
 echo " # bash general.sh <parm>                                                   #";
 echo " # - purge       : Suppression des sources du systeme                       #";
 echo " # - download    : Telecharge et extrait les sources                        #";
 echo " # - edit        : Edite la configuration du Noyau                          #";
 echo " # - clean       : Purge les fichiers lors de compilation                   #";
 echo " # - compilation : Lancement de la compilation Multi-thread                 #";
 echo " # - install     : Installation des modules et du Kernel sur le systeme     #";
 echo " # - uninstall   : Desinstallation des modules et du Kernel sur le systeme  #";
 echo "#############################################################################";
}

######################################################################################################################################################
# Conditionnement #
###################
case $1 in
 # ====================================
 purge)
  clear;
  KERNEL_PURGE;
  ;;
 # ====================================
 download)
  clear;
  DOWNLOAD_KERNEL;
  ;;
 # ====================================
 edit)
  clear;
  KERNEL_EDIT;
  ;;
 # ====================================
 clean)
  clear;
  KERNEL_CLEAN;
  ;;
 # ====================================
 compilation)
  clear;
  KERNEL_COMPILATION;
  ;;
 # ====================================
 install)
  clear;
  INSTALL_SYSTEM_MODULE;
  INSTALL_SYSTEM_KERNEL;
  INSTALL_SYSTEM_UPDATE_GRUB;
  ;;
 # ====================================
 uninstall)
  clear;
  UNINSTALL_NEW_KERNEL;
  ;;
 # ====================================
 *)
  clear;
  GUIDE;
  ;;
 # ====================================
esac
