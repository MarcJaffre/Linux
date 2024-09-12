------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Gestion des ACL</p>

------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation

------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Installation
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

------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Pratiques
#### A. Creation de l'arborescence
```bash
clear;
rm -rf /Data/{Informaticien,Direction};
mkdir -p /Data/{Informaticien,Direction};
```

#### B. Permissions
Le propriétaire et le groupe propriétaire ont tous les droits.
```bash
clear;
chmod -R 770 /Data/*;
```

#### C. Groupe Propriétaire
On définit le groupe sur `informaticien`.
```bash
chown -R root:informaticien /Data/Informaticien;
```

#### D. StickyBit
Seul le propriétaire peut supprimer le dossier Informaticien.
```bash
clear;
chmod -R 1770 /Data/Informaticien;
```

#### E. Création d'un Groupe informaticien
```bash
clear;
groupadd informaticien
```

#### F. Ajout l'utilisateur au groupe
```bash
clear;
usermod -aG informaticien marc 2>/dev/null;
```

#### G. Retirer l'utilisateur au groupe
```bash
clear;
gpasswd -d marc informaticien;
```
