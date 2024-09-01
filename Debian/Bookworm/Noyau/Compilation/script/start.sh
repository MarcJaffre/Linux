#!/usr/bin/bash

#########################################################################################################################################################
# Chargement du fichier de configuration #
##########################################
if [ -f settings ]; then
 source settings;
fi
if [ ! -f settings ]; then
 echo "Le fichier de configuration n'existe pas.";
 exit;
fi

#########################################################################################################################################################
# Nettoyage #
#############
clear;

#########################################################################################################################################################
# Purge #
#########
# Si le dossier existe alors
if [ -d $DOSSIER/linux-${VERSION} ]; then
   # =====================================================================
   # Si la valeur de la purge est sur ON alors
   if [ $PURGE = ON ];then
      rm -r $DOSSIER/linux-${VERSION}* 2>/dev/null;
   fi
   # Si la valeur de la purge est sur OFF alors
   if [ $PURGE = OFF ];then
      echo "Le dossier $DOSSIER/linux-${VERSION} n'a pas été purgé";
   fi
   # Variable inutile pour éviter une erreur dans la console
   RC=O
   # =====================================================================
fi


#########################################################################################################################################################
# Source #
##########
# Si le dossier n'existe pas alors lancer alors
if [ ! -d $DOSSIER/linux-${VERSION} ]; then
   # =====================================================================
   # si la valeur de la purge est sur ON alors
   if [ $PURGE = ON ];then
      # Telecharger et extraire le kernel
      echo "Lancement du telechargement du Kernel";
      wget $KERNEL -O $DOSSIER/linux-${VERSION}.tar.xz  2>/dev/null;
      tar -xf         $DOSSIER/linux-${VERSION}.tar.xz -C $DOSSIER/;
   fi
   # Variable inutile pour éviter une erreur dans la console
   RC=0
   # =====================================================================
fi

#########################################################################################################################################################
# Compilation #
###############
# Si le dossier existe alors
if [ -d $DOSSIER/linux-${VERSION} ]; then
   cd $DOSSIER/linux-${VERSION};
   # Generer le fichier de configuration
   make menuconfig;
   echo "-----------------------------------------------------------------------------" >  $DOSSIER/linux-${VERSION}/Build.log;
   echo "# Nettoyage du KERNEL "                                                        >> $DOSSIER/linux-${VERSION}/Build.log;
   make clean                                                                           >> $DOSSIER/linux-${VERSION}/Build.log;
   echo ""                                                                              >> $DOSSIER/linux-${VERSION}/Build.log;
   echo ""                                                                              >> $DOSSIER/linux-${VERSION}/Build.log;
   echo ""                                                                              >> $DOSSIER/linux-${VERSION}/Build.log;
   echo "-----------------------------------------------------------------------------" >> $DOSSIER/linux-${VERSION}/Build.log;
   echo "# Compilation du KERNEL "                                                      >> $DOSSIER/linux-${VERSION}/Build.log;
   make ARCH=$(arch) -j$(nproc)                                                         >> $DOSSIER/linux-${VERSION}/Build.log 2>&1;

   # Trapper la date et heure de fin du script
   END_DATE=$(date +'%Y/%m/%d')
   END_HORAIRE=$(date +'%H H %M')
   echo ""                                                                              >> $DOSSIER/linux-${VERSION}/Build.log;
   echo ""                                                                              >> $DOSSIER/linux-${VERSION}/Build.log;
   echo "-----------------------------------------------------------------------------" >> $DOSSIER/linux-${VERSION}/Build.log;

   # Écriture des dates et heures de début et de fin dans le fichier de log
   echo "Demarrage du script : $START_DATE à $START_HORAIRE";                           >> $DOSSIER/linux-${VERSION}/Build.log;
   echo "Fin du script       : $END_DATE à $END_HORAIRE";                               >> $DOSSIER/linux-${VERSION}/Build.log;

   # Renommage de la log de compilation
   mv                          $DOSSIER/linux-${VERSION}/Build.log                         $DOSSIER/linux-${VERSION}/Build_$START_DATE_$START_HORAIRE.log;
   #########################################################################################################################################################
fi
