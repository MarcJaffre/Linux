########################################################################################################################################################
# Présentation #
################
# Outil pour sauvegarder / Restaurer la configuration d'un routeur

########################################################################################################################################################
# Documentation #
#################
# http://www.arnaud.rabier.info/wp-content/uploads/2020/02/Oxidized.pdf

########################################################################################################################################################
# Dépendances #
###############
clear;
apt update;
apt install -y cmake;
apt install -y libicu-dev;
apt install -y libsqlite3-dev;
apt install -y libssh2-1-dev;
apt install -y libssl-dev;
apt install -y libyaml-dev;
apt install -y g++;
apt install -y pkg-config;
apt install -y ruby ruby-dev;
apt install -y zlib1g-dev;
apt install -y -f;

########################################################################################################################################################
# Installation #
################
gem install oxidized;
gem install oxidized-script;
gem install oxidized-web;

# Fix: Error loading config: undefined method `unsafe_load' for Psych:Module
gem install psych -v 3.3.2;

########################################################################################################################################################
# Utilisateur de service #
##########################
#
# Creation de compte
useradd -s /bin/bash -m oxidized;
#
# Mot de passe:
(echo "oxidized:admin") | chpasswd;

########################################################################################################################################################
# Création de dossier #
#######################
mkdir /run/oxidized;

########################################################################################################################################################
# Permission #
##############
chown oxidized:oxidized /run/oxidized;

########################################################################################################################################################
# Création du service #
#######################
cp /var/lib/gems/2.7.0/gems/oxidized-0.26.3/extra/oxidized.service /lib/systemd/system/;

########################################################################################################################################################
# Purge Ruby #
##############
#gem uninstall -aIx;
#gem cleanup;






########################################################################################################################################################
# LibeNMS #
###########
# Ajouter un Utilisateur : oxidized (admin global)
# Créer une clé API      : ac55f9df39d89682d2b5efca6d95ec5c (Liée au compte oxidized)

########################################################################################################################################################
# Test API #
############
curl -H 'X-Auth-Token: ac55f9df39d89682d2b5efca6d95ec5c' 'http://127.0.0.1/api/v0/oxidized'
[
    {
        "hostname": "192.168.200.11",
        "os": "proxmox",
        "ip": "192.168.200.11"
    }

########################################################################################################################################################
# Configuration #
#################
#
# Génération de la configuration
runuser -l oxidized -c 'rm ~/.config/oxidized/config;oxidized';
#
runuser -l oxidized -c 'nano ~/.config/oxidized/config';



########################################################################################################################################################
# Redémarrage du service #
##########################
clear;
runuser -l oxidized -c 'rm ~/.config/oxidized/config; nano ~/.config/oxidized/config';
systemctl daemon-reload;
systemctl restart oxidized.service;
systemctl status oxidized.service;
curl -H 'X-Auth-Token: ac55f9df39d89682d2b5efca6d95ec5c' 'http://127.0.0.1/api/v0/oxidized'
journalctl -f -u oxidized.service;

# 

########################################################################################################################################################
# Activation du service #
#########################
systemctl enable oxidized.service;




########################################################################################################################################################
# WebUI #
#########
Enable Oxidized support                                 : Enable
URL to your Oxidized API                                : http://127.0.0.1:8888/
Enable config versioning access                         : Enable
Enable the return of groups to Oxidized                 : Enable
Set the default group returned                          : default
Reload Oxidized nodes list, each time a device is added : Enable

New Map Rule:
    os = routeros
    group < mikrotik
    

Do not backup these OS: proxmox





---
########################################################################################################################################################
# Identifiant par defaut #
##########################
#username: oxidized
#password: admin

########################################################################################################################################################
# Models chargés #
##################
model: airos, dlink, edgeos, edgeswitch, firelinuxos, firewareos, fortios, ios, linuxgeneric, model, netgear, openwrt, pfsense, routeros, tplink

########################################################################################################################################################
# Global #
##########
resolve_dns: true
interval: 3600
use_syslog: false
debug: false
threads: 30
timeout: 20
retries: 3
prompt: !ruby/regexp /^([\w.@-]+[#>]\s?)$/

########################################################################################################################################################
# API rest #
############
rest: 127.0.0.1:8888

########################################################################################################################################################
# Variables #
#############
vars: {}

########################################################################################################################################################
# Models #
##########
models:
 mikrotik:
  username: marc
  password: admin

########################################################################################################################################################
pid: "/home/oxidized/.config/oxidized/pid"

########################################################################################################################################################
crash:
  directory: "/home/oxidized/.config/oxidized/crashes"
  hostnames: false
stats:
  history_size: 10
next_adds_job: false

########################################################################################################################################################
input:
  default: ssh, telnet
  debug: false
  ssh:
    auth_methods: [ "password", "keyboard-interactive" ]
    secure: false
    keys: false
  ftp:
    passive: true
  utf8_encoded: true

########################################################################################################################################################
output:
  default: file
  file:
    directory: "/home/oxidized/.config/oxidized/configs"

########################################################################################################################################################
source:
  # ================================================================
  default: http
  debug: false
  # ================================================================
  http:
    url: http://127.0.0.1/api/v0/oxidized
    scheme: http
    delimiter: !ruby/regexp /:/
    map:
      name: hostname
      model: os
      group: group
      ip: ip
    headers:
      X-Auth-Token: 'ac55f9df39d89682d2b5efca6d95ec5c'
  # ================================================================
  csv:
    file: "/home/oxidized/.config/oxidized/router.db"
    delimiter: !ruby/regexp /:/
    map:
      name: 0
      model: 1
    gpg: false
  # ================================================================



########################################################################################################################################################
groups:
  # =======================================================================
  default:
     username: root
     password: admin
  # =======================================================================
  mikrotik:
   username: marc
   password: admin
  # =======================================================================
  pfsense:
     username: admin
     password: pfsense

########################################################################################################################################################
model_map:
  # ================================================================
  juniper: junos
  cisco: ios
  # ================================================================
  proxmox: linuxgeneric
  # ================================================================
  mikrotik: routeros
  # ================================================================
