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
# Dossier de Travail #
######################
# Si le dossier existe pas alors creer le
if [ ! -d $DOSSIER/ ]; then
 mkdir -p $DOSSIER/;
fi

#########################################################################################################################################################
# Purge #
#########
# Si le dossier existe alors
if [ -d $DOSSIER/linux-${VERSION} ]; then
   # =====================================================================
   # Si la valeur de la purge est sur ON alors
   if [ $PURGE = ON ];then
      rm -r $DOSSIER/linux-${BRANCHE}.0.0 2>/dev/null;
   fi
   # Si la valeur de la purge est sur OFF alors
   if [ $PURGE = OFF ];then
      echo "Le dossier $DOSSIER/linux-${BRANCHE}.0.0 n'a pas été purgé";
   fi
   # Variable inutile pour éviter une erreur dans la console
   RC=O
   # =====================================================================
fi


#########################################################################################################################################################
# Source #
##########
# Si le dossier n'existe pas alors lancer alors
if [ ! -d $DOSSIER/linux-${BRANCHE}.0.0 ]; then
   # =====================================================================
   # si la valeur de la purge est sur ON alors
   if [ $PURGE = ON ];then
      # Telecharger et extraire le kernel
      echo "Lancement du telechargement du Kernel et du patch";
      wget $DL_KERNEL -O $DOSSIER/linux-${BRANCHE}.0.0.tar.xz  2>/dev/null;
      wget $DL_PATCH  -O $DOSSIER/linux-${BRANCHE}.${PATCH_MAJEUR}.${PATCH_MINEUR}.tar.xz     2>/dev/null;
      echo "Extraction des fichiers";
      tar -xf            $DOSSIER/linux-${BRANCHE}.0.0.tar.xz                                -C $DOSSIER/;
      tar -xf            $DOSSIER/patch-${BRANCHE}.${PATCH_MAJEUR}.${PATCH_MINEUR}.tar.xz    -C $DOSSIER/;
   fi
   # Variable inutile pour éviter une erreur dans la console
   RC=0
   # =====================================================================
fi





#########################################################################################################################################################
# Patchage #
############
# Si le dossier existe alors
if [ -d $DOSSIER/linux-${BRANCHE}.0.0 ]; then
   cd   $DOSSIER/linux-${BRANCHE}.0.0;
   patch -p1 < ../$DOSSIER/patch-${BRANCHE}.${PATCH_MAJEUR}.${PATCH_MINEUR};
   make kernelversion;
fi



#########################################################################################################################################################
# Compilation #
###############
# Si le dossier existe alors
#if [ -d $DOSSIER/linux-${BRANCHE}.0.0 ]; then
   #cd   $DOSSIER/linux-${BRANCHE}.0.0;

   # Generer le fichier de configuration
   #make menuconfig;

   # Nettoyage
   #make clean;

   #START_DATE=$(date +'%Y/%m/%d')
   #START_HORAIRE=$(date +'%H H %M')
   
   #echo "-----------------------------------------------------------------------------" >  $DOSSIER/linux-${BRANCHE}.0.0/Build.log;
   #echo "# Compilation du KERNEL "                                                      >> $DOSSIER/linux-${BRANCHE}.0.0/Build.log;
   #make ARCH=$(arch) -j$(nproc)                                                         >> $DOSSIER/linux-${BRANCHE}.0.0/Build.log 2>&1;

   # Trapper la date et heure de fin du script
   #END_DATE=$(date +'%Y/%m/%d')
   #END_HORAIRE=$(date +'%H H %M')
   #echo ""                                                                              >> $DOSSIER/linux-${BRANCHE}.0.0/Build.log;
   #echo ""                                                                              >> $DOSSIER/linux-${BRANCHE}.0.0/Build.log;
   
   #echo "-----------------------------------------------------------------------------" >> $DOSSIER/linux-${BRANCHE}.0.0/Build.log;
   # Écriture des dates et heures de début et de fin dans le fichier de log
   #echo "Demarrage du script : $START_DATE à $START_HORAIRE"                            >> $DOSSIER/linux-${BRANCHE}.0.0/Build.log;
   #echo "Fin du script       : $END_DATE à $END_HORAIRE"                                >> $DOSSIER/linux-${BRANCHE}.0.0/Build.log;

   # Renommage de la log de compilation
   #mv                          $DOSSIER/linux-${BRANCHE}.0.0/Build.log                  $DOSSIER/linux-${BRANCHE}.0.0/Build_$START_DATE_$START_HORAIRE.log;
   #########################################################################################################################################################
#fi



# Ancienne Configuration
# rm .config 2>/dev/null;
# cp /boot/config-$(uname -r) .config;
