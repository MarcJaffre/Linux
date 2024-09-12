------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Gestion des ACL</p>

------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Afficher les permissions
```bash
clear;
getfacl fichier.txt;
getfacl -R .;
```

#### B. Modifier les permissions
Le paramètre `u` ajout les permissions pour l'utilisateurs et le paramètre `g` pour le groupe.

```bash
clear;
setfacl -m u:marc:rwx fichier.txt;
setfacl -m g:marc:rwx fichier.txt;
getfacl fichier.txt;
```

#### C. Modifier les permissions (Recursive)
```bash
clear;
setfacl -Rm u:marc:rwx .;
setfacl -Rm g:marc:rwx .;
```

#### D. Retirer des permissions
```bash
clear;
setfacl -x u:marc fichier.txt
setfacl -x g:marc fichier.txt
setfacl -m u:marc:--- fichier.txt
```

#### E. Retirer des permissions (Recursive)
```bash
clear;
setfacl -Rx u:marc .;
setfacl -Rx g:marc .;
```



