----------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Guide d'utilisation du gestionnaire de paquet APT </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation d'APT
APT est un gestionnaire de paquet Linux, qui utilise des dépôts (bibliothèque logiciel)

Lorsqu'on lance le paramètre `update` on met à jour la liste des paquets disponibles.

Puis en faisant `upgrade` ont met à niveau les paquets.

Le terme `dist-upgrade` est utilisé pour faire une monté de version d'une distribution . (Debian 11 vers 12 par exemple)

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Fonctionnement de base d'un dépôt

#### A. Sources.list
```
deb http://ftp.fr.debian.org/debian/   bullseye     main contrib non-free

# deb : Paquet pour Debian
# http://ftp.fr.debian.org/debian/ : URL de base du dépôt
# bullseye : version de la distribution
# main     : Catégorie de paquet. (Logiciel ou pilote Libre uniquement) 
# contrib  : Catégorie de paquet. (Logiciel ou pilote Libre uniquement) 
# non-free : Catégorie de paquet. (Logiciel et pilote propriétaire uniquement)
#          : Pour bookworm les pilotes ont été séparés des logiciels propriétaires !
```

#### B. Arborescence de base
Lorsqu'on ouvre le liens du [DEPOT](http://ftp.fr.debian.org/debian/`), on peut observer des dossiers et des fichiers.

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/abd3df60-fcbd-47ba-b805-1b28e86b5980' /> </p>


#### C. Mécanisme APT
Le programme apt va taper l'URL du Dépôt pour aller dans `dists` puis la `version` et va accéder au `Catégories`.

Si le paquet est dans une catégorie déclarer dans le fichier sources.list il va le télécharger.

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/6a8bdce0-e5be-46c4-94c1-5fda51e0d2c2' /> </p>

#### D. Les catégories
<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/dd066ff0-f2a9-484b-9cfd-aeec63594ae1' /> </p>
