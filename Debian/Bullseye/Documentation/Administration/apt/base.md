----------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Guide d'utilisation du gestionnaire de paquet APT </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation d'APT

----------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Fonctionnement de base d'un dépôt

#### A. Sources.list
```
#   | URL DE DEPOT                 |   |Version|    | CATEGORIE DE PAQUET POUR APT        |
deb http://ftp.fr.debian.org/debian/   bullseye     main contrib non-free
```

#### B. Arborescence de base
Lorsqu'on ouvre le liens du [DEPOT](http://ftp.fr.debian.org/debian/`), on peut observer des dossiers et des fichiers.

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/abd3df60-fcbd-47ba-b805-1b28e86b5980' /> </p>



#### C. Mécanisme APT
Le programme apt va taper l'URL du Dépôt pour aller dans `dists` puis la `version` et va accéder au `Catégories`.

Si le paquet est dans une catégorie déclarer dans le fichier sources.list il va le télécharger.

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/6a8bdce0-e5be-46c4-94c1-5fda51e0d2c2' /> </p>


#### D. Les catégories
