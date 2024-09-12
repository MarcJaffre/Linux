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
#### A. Exemple
```bash
clear;
mkdir -p /Data/test/direction
touch /Data/test/fichier1.txt;
touch /Data/test/fichier2.txt;
chmod -R 700 /Data/test;
```
#### B. Ajout de permissions
```bash
clear;
setfacl -m u:marc:r-x /Data/test;
setfacl -m u:marc:rwx /Data/test/fichier1.txt;
```

| Objets                  | chmod | ACL |
| ----------------------- | ----- | --- |
| /Data/test              | 700   | r-x |
| /Data/test/direction    | 700   | --- |
| /Data/test/fichier1.txt | 700   | rwx |
| /Data/test/fichier2.txt | 700   | --- |
