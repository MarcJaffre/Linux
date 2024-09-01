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
# Edition de la configuration #
###############################
xconfig  $DOSSIER/linux${VERSION}/.config;
