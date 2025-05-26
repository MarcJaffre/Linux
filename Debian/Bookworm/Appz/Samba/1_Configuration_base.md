--------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration de base de samba </p>
--------------------------------------------------------------------------------------------------------------------------------------------
## I. Base Linux
### A. Liste les utilisateurs linux
```bash
clear;
cat /etc/passwd
```
### B. Information sur l'utilisateur
```bash
clear;
id <UID>
```

<br />

--------------------------------------------------------------------------------------------------------------------------------------------
## II. Samba
### A. Gestion des partages
#### 1. Sauvegarder la configuration par défaut
```bash
clear;
cp /etc/samba/smb.conf > /etc/samba/smb.conf.bak;
```

#### 2. Edition de la configuration
```bash
clear;
nano /etc/samba/smb.conf;
```
#### 3. smb.conf (Epurer)
```bash
[global]
## Browsing/Identification ###
   workgroup            = WORKGROUP
   client min protocol  = SMB2
   client max protocol  = SMB3

#### Networking ####

#### Debugging/Accounting ####
   log file              = /var/log/samba/log.%m
   max log size          = 1000
   logging               = file
   panic action          = /usr/share/samba/panic-action %d

####### Authentication #######
   server role           = standalone server
   obey pam restrictions = yes
   unix password sync    = yes
   passwd program        = /usr/bin/passwd %u
   passwd chat           = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
   pam password change   = yes
   map to guest          = bad user

# ======================= Share Definitions =======================
#
[homes]
comment                  = Dossier Utilisateurs
browseable               = no
read only                = no
writable                 = yes
create mask              = 0700
directory mask           = 0700
guest ok                 = no
valid users              = %S
# ==================================================================
# COLLER VOS PARTAGES ICI
# ==================================================================
;   write list = root, @lpadmin
# ==================================================================
```
