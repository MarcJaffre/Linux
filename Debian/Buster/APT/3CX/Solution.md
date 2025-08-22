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

Puis il faut le restaurer.

```bash
clear;
su -u phonesystem;

# Sauvegardes (Complète et partiel)
3CXBackupCmd --file=$HOME/part_pbx_backup.zip --options=CH,PROMPTS,FW,REC,VM --log=$HOME/pbx-backup_part.log;
3CXBackupCmd --file=$HOME/full_pbx_backup.zip --options=ALL                  --log=$HOME/pbx-backup_full.log;

# Correctif
rm /tmp/3cxpbx.sync;

# Restauration Partiel
3CXRestoreCmd --file=$HOME/part_pbx_backup.zip --log=$HOME/pbx_resto_part.log;

# Retour en arrière
3CXRestoreCmd --file=$HOME/full_pbx_backup.zip --log=$HOME/pbx_resto_full.log;
```

```bash
# Si les actions précédentes ont étés fait en root :
cd /var/lib/3cxpbx/Instance1/Data/Http/Interface/provisioning;
chmod 750 *;
chown -R phonesystem:phonesystem *;
```
