--------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Gestion des partages </p>
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. smb.conf
### A. Utilisateur
L'utilisateur `marc` sur ma machine linux existe.

### B. Documentation
```
#[NomdemonPartage]
#comment              = Mon commentaire
#path                 = /chemin
#browseable           = yes | no (Partage Visible ou cacher)
#writable             = yes | no 
#write list           = # Si writable absent
#read only            = yes | no
#valid users          = USER1, USER2, @groupe12000 %S  (Utilisateurs, Groupe ou Services autorisés)
#force user           = utilisateur de substitution
#create mask          = 0700 (Conseiller) | 0755 (déconseiller)
#directory mask       = 0700 (Conseiller) | 0755 (déconseiller)         
#force create mode    = 0700
#force directory mode = 0700   
#guest ok             = no | yes (Permet aux clients de se connecter au répertoire partagé sans fournir de mot de passe.)
```

### C. Apache2
Pour permettre l'accès correct à Apache2, il faut faire `chown -R www-data:www-data /var/www`
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


