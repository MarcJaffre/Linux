--------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Gestion des partages </p>
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. smb.conf
### A. Utilisateur
L'utilisateur `marc` sur ma machine linux existe.

```
# ==================================================================
[Apache] 
comment              = Dossier Apache
path                 = /var/www/html
browseable           = yes
writable             = yes
read only            = no
valid users          = marc 
force user           = www-data
force group          = www-data
create mask          = 0700
directory mask       = 0700
force create mode    = 0700
force directory mode = 0700
# ==================================================================
```
