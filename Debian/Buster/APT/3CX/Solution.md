------------------------------------------------------------
# <p align='center'> Solution à différente problèmatique </p>

------------------------------------------------------------
## I. Général
### A. FQDN / Licence
#### 1. Présentation
```
Le serveur 3CX est associé à un FQDN / Licence mais dans le portal 3CX sa ne correspond plus ou à été supprimée
```
#### 2. Solution ([Doc](https://www.3cx.com/docs/backup-restore-command-line/))
Pour résoudre le problème, il faut réaliser une sauvegarde en excluant ce qui pose problème. (FQDN, Licence)

Puis il faut réinstaller le 3CX et faire la restauration.

```bash
clear;

#################################################################################################################################
# Root #
########
#
# Creation du dossier Backup
mkdir /backup;
#
# Modification des permissions
chown -R phonesystem:phonesystem /backup;
#
#################################################################################################################################
# Utilisateur #
###############
#
# Changer Utiliser
su - phonesystem;
#
# Sauvegardes (Complète et partiel)
/usr/sbin/3CXBackupCmd --file=/backup/full_pbx_backup.zip --options=ALL                  --log=/backup/pbx-backup_full.log;
/usr/sbin/3CXBackupCmd --file=/backup/part_pbx_backup.zip --options=CH,PROMPTS,FW,REC,VM --log=/backup/pbx-backup_part.log;
#
# Correctif
rm /tmp/3cxpbx.sync;
#
#################################################################################################################################
# Root #
########
# Remise à zéro du 3CX
/usr/sbin/3CXWizard --cleanup;
#################################################################################################################################
# Utilisateur #
###############
#
# Changer Utiliser
su - phonesystem;
#
# Restauration Partiel
/usr/sbin/3CXRestoreCmd --file=/backup/part_pbx_backup.zip --log=/backup/pbx_resto_part.log;
#
# Retour en arrière
/usr/sbin/3CXRestoreCmd --file=/backup/full_pbx_backup.zip --log=/backup/pbx_resto_full.log;
#################################################################################################################################
```



```bash
# Si les actions précédentes ont étés fait en root :
cd /var/lib/3cxpbx/Instance1/Data/Http/Interface/provisioning;
chmod 750 *;
chown -R phonesystem:phonesystem *;
```
