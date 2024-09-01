#!/usr/bin/bash

#######################################################################################################################################################
# Configuration #
#################
source settings;

#######################################################################################################################################################
# Nettoyage #
#############
clear;

#######################################################################################################################################################
# Purge #
#########
if [ -d $DOSSIER/linux-${VERSION} ]; then
   # =====================================================================
   if [ $PURGE = ON ];then
      rm -r $DOSSIER/linux-${VERSION}* 2>/dev/null;
   fi
   if [ $PURGE = OFF ];then
      echo "Le dossier $DOSSIER/linux-${VERSION} n'a pas été purgé";
   fi
   RC=O
   # =====================================================================
fi

#######################################################################################################################################################
# Source #
##########
if [ ! -d $DOSSIER/linux-${VERSION} ]; then
   # =====================================================================
   if [ $PURGE = ON ];then
      wget $KERNEL -O $DOSSIER/linux-${VERSION}.tar.xz  2>/dev/null;
      tar -xf         $DOSSIER/linux-${VERSION}.tar.xz -C $DOSSIER/;
   fi
   RC=0
   # =====================================================================
fi

#######################################################################################################################################################
# Compilation #
###############
if [ -d $DOSSIER/linux-${VERSION} ]; then
   cd $DOSSIER/linux-${VERSION};
   make menuconfig;

# Nettoyage du kernel
   echo "-----------------------------------------------------------------------------" >  $DOSSIER/linux-${VERSION}/Build.log;
   echo "# Nettoyage du KERNEL "                                                        >> $DOSSIER/linux-${VERSION}/Build.log;
   make clean                                                                           >> $DOSSIER/linux-${VERSION}/Build.log;
   echo ""                                                                              >> $DOSSIER/linux-${VERSION}/Build.log;
   echo ""                                                                              >> $DOSSIER/linux-${VERSION}/Build.log;
   echo ""                                                                              >> $DOSSIER/linux-${VERSION}/Build.log;
   echo "-----------------------------------------------------------------------------" >> $DOSSIER/linux-${VERSION}/Build.log;
   echo "# Compilation du KERNEL "                                                      >> $DOSSIER/linux-${VERSION}/Build.log;
   make ARCH=$(arch) -j$(nproc)                                                         >> $DOSSIER/linux-${VERSION}/Build.log 2>&1;
   END_DATE=$(date +'%Y/%m/%d')
   END_HORAIRE=$(date +'%H H %M')
   echo ""                                                                              >> $DOSSIER/linux-${VERSION}/Build.log;
   echo ""                                                                              >> $DOSSIER/linux-${VERSION}/Build.log;
   echo "-----------------------------------------------------------------------------" >> $DOSSIER/linux-${VERSION}/Build.log;
   echo "Demarrage du script : $START_DATE à $START_HORAIRE";                           >> $DOSSIER/linux-${VERSION}/Build.log;
   echo "Fn du script        : $END_DATE à $END_HORAIRE";                               >> $DOSSIER/linux-${VERSION}/Build.log;
   #######################################################################################################################################################
fi
