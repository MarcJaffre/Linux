------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Exemple de droit pour le partage </p>
------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Exemple
#### A. Présentation
```
- Le dossier Data contiendera une arborescence de dossier
- La suppression des dossiers ne sera accessible que par le propriétaire. (root)
- Chaque utilisateur appartenant au groupe pourras accéder au dossier
```


#### B. Création des groupes
```bash
clear;
groupadd Comptables;
groupadd Commun;
groupadd Direction;
groupadd Informaticiens;
```

#### C. Creation de l'arborescence
```bash
clear;
rm -rf /Data/{Comptable,Commun,Direction,Informaticien};
mkdir -p /Data/{Comptable,Commun,Direction,Informaticien};
```

#### D. Définir les permissions de base
Le propriétaire et le groupe propriétaire ont tous les droits.
```bash
clear;
chmod -R 770 /Data/*;
```

#### E. Définir les Groupes Propriétaires
On définit le groupe sur `informaticien`.
```bash
chown -R root:Comptables     /Data/Comptable;
chown -R root:Commun         /Data/Commun;
chown -R root:Direction      /Data/Direction;
chown -R root:Informaticiens /Data/Informaticien;
```

#### F. Mise en place du StickyBit
Seul le propriétaire peut supprimer le dossier Informaticien.
```bash
clear;
chmod -R 1770 /Data/*;
```

#### G. Ajout l'utilisateur au groupe
Il est nécessaire que l'utilisateur se déconnecte après modification.
```bash
clear;
usermod -aG Informaticiens marc;
```

#### H. Retirer l'utilisateur au groupe
```bash
clear;
gpasswd -d marc Informaticiens;
```
