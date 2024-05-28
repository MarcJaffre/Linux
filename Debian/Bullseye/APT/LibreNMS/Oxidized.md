# Présentation
Outil pour sauvegarder / Restaurer la configuration d'un routeur

# Documentation
```bash
http://www.arnaud.rabier.info/wp-content/uploads/2020/02/Oxidized.pdf
```

# Dépendances
```bash
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
```

# Installation
```bash
clear;
gem install oxidized;
gem install oxidized-script;
gem install oxidized-web;

Fix: Error loading config: undefined method `unsafe_load' for Psych:Module
gem install psych -v 3.3.2;
```

# Utilisateur de service
# Creation de compte
```bash
clear;
useradd -s /bin/bash -m oxidized;
```

# Mot de passe:
```bash
clear;
(echo "oxidized:admin") | chpasswd;
```

# Création de dossier
```bash
clear;
mkdir /run/oxidized;
```

# Permission
```bash
clear;
chown oxidized:oxidized /run/oxidized;
```

# Création du service
```bash
clear;
PATH_SERVICE=$(find /var/lib/ -name "oxidized.service" | head -n1)
cp $PATH_SERVICE /lib/systemd/system/;
```

# Purge Ruby
```bash
clear;
#gem uninstall -aIx;
#gem cleanup;
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LibeNMS
Ajouter un Utilisateur : oxidized (admin global)
Créer une clé API      : Liée au compte oxidized

# Test API 
```bash
clear;
curl -H 'X-Auth-Token: XXXXXXXXXXXXXXXX' 'http://127.0.0.1/api/v0/oxidized'
```

```
[
    {
        "hostname": "192.168.200.11",
        "os": "proxmox",
        "ip": "192.168.200.11"
    }
```

# Configuration
# Creation de dossier (Backup)
```bash
clear;
runuser -l oxidized -c 'mkdir -p /home/oxidized/.config/oxidized/configs'
```

# Génération de la configuration
Remplacer `XXXXXXXXXXXXXXXXXXXXXXXX` par la clé API du compte `oxidized`.

```bash
clear;
runuser -l oxidized -c 'rm ~/.config/oxidized/config; nano ~/.config/oxidized/config';
```

```bash
---

########################################################################################################################################################
# Models charges #
##################
model: airos, dlink, edgeos, edgeswitch, firelinuxos, firewareos, fortios, ios, linuxgeneric, model, netgear, openwrt, pfsense, routeros, tplink, zynosgs
########################################################################################################################################################
# Global #
##########
resolve_dns: false
interval: 3600
use_syslog: false
debug: false
threads: 5
timeout: 10
retries: 1
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
# Chemin du Processus #
#######################
pid: "/home/oxidized/.config/oxidized/pid"
########################################################################################################################################################
# Crash #
#########
crash:
  directory: "/home/oxidized/.config/oxidized/crashes"
  hostnames: false
stats:
  history_size: 10
########################################################################################################################################################
# ??????????? #
###############
next_adds_job: false
########################################################################################################################################################
# Protocole #
#############
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
# Dossier de Backup #
#####################
#
# Non Fonctionnel 
#
#
output:
 file:
  directory: "/home/oxidized/.config/oxidized/configs/"
########################################################################################################################################################
# Source oxidized #
###################
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
      X-Auth-Token: 'XXXXXXXXXXXXXXXXXXXXXXXX'
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
model_map:
  # ================================================================
  cisco: ios
  # ================================================================
  juniper: junos
  # ================================================================
  mikrotik: routeros
  # ================================================================
  proxmox: linuxgeneric
  # ================================================================
  #zywall: ios

########################################################################################################################################################
# Identifiant par defaut #
##########################
#username: oxidized
#password: admin

########################################################################################################################################################
# Identifiant par Groupe des équipements #
##########################################
groups:
  # =======================================================================
  blacklist:
  # =======================================================================
  default:
     username: "root"
     password: "admin"
  # =======================================================================
  mikrotik:
     username: "marc"
     password: "admin"
  # =======================================================================
  mikrotik_vm:
     username: "marc"
     password: "admin"
  # =======================================================================
  pfsense:
     username: "admin"
     password: "pfsense"
  # =======================================================================
  zyxel:
     username: "admin"
     password: "XXXXXXXXX"


########################################################################################################################################################
# Models #
##########
#
# On declare les groupes pour que les profils User/Password marche si l'objet est bien classe.
#
models:
 default:
 mikrotik:
 mikrotik_vm:
 pfsense:
 zyxel:
```



# WebUI
```
Enable Oxidized support                                 : Enable
URL to your Oxidized API                                : http://127.0.0.1:8888/
Enable config versioning access                         : Enable
Enable the return of groups to Oxidized                 : Enable
Set the default group returned                          : default
Do not backup these Oxidized groups                     : blacklist
Reload Oxidized nodes list, each time a device is added : Enable

New Map Rule:
    os = routeros        | group < mikrotik
    ip = 192.168.200.50  | group < mikrotik_vm
    os = zywall          | group < blacklist
    ip = XXX.XXX.XXX.XXX | group < blacklist

Do not backup these OS: proxmox
```

# Redémarrage du service
```bash
clear;
systemctl daemon-reload;
systemctl restart oxidized.service;
systemctl status oxidized.service;
journalctl -f -u oxidized.service;
```

# Afficher Backup
```bash
clear;
ls -la /home/oxidized/.config/oxidized/;
```

# Activation du service
```bash
clear;
systemctl enable oxidized.service;
```
