----------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Guide d'utilisation du gestionnaire de paquet APT </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. A quoi sert APT ? 
APT est un gestionnaire de paquet Linux, qui utilise des dépôts (bibliothèque logiciel) pour installer ou mettre à jour des paquets. (logiciels)

Lorsqu'on lance le paramètre `update` on met à jour la liste des paquets disponibles.

Puis en faisant `upgrade` ont met à niveau les paquets.

Le terme `dist-upgrade` est utilisé pour faire une monté de version d'une distribution . (Debian 11 vers 12 par exemple)

#### B. Debian.org
##### 1. Site de base
Le site [Debian.org](https://www.debian.org/distrib/packages) permet de trouver le dépôt pour le logiciel qu'on souhaite installer.

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/deaade3b-7ee6-470e-91c3-9c2e3e483c14' /> </p>


##### 2. Recherche par paquet
La recherche de paquet depuis le site est utile pour obtenir le dépôt mais aussi la version d'un paquet.

Dans le champs `Recherche dans les répertoires de paquets` on indiquera `nano`.

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/d337dfa5-63f1-4d52-9be0-20fc70c1f8e3' /> </p>

##### 3. Filtrer le rendu
Dans le bandeau du site, on peut sélectionner la distribution puis son architecture de paquet pour obtenir le bon résultat.

Pour l'architecture 32 Bits (x86) : i386

Pour l'architecture 64 Bits (x64) : AMD64

Liens de la recherche du paquet : [Bullseye/amd64](https://packages.debian.org/search?suite=bullseye&arch=amd64&searchon=names&keywords=nano)

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/b44808a8-7396-43b8-b02d-404b496b9230' /> </p>

##### 4. Page du paquet
On peut vérifier si on est sur la bonne version de linux en regardant en haut à droite de la page du paquet [nano](https://packages.debian.org/bullseye/nano). 

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/afff8fcf-72ca-4d6e-8a08-b7bd7934bb8f' /> </p>

Puis on peux voir les dépendances de ce paquet.

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/89281367-d996-4925-94a3-23452402e5c2' /> </p>

On choisis l'architecture qu'on souhaite télécharger le paquet. (amd64)

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/0ff9dc6d-60e5-4e5f-bb0e-db52260b7b7d' /> </p>

##### 5. Page de téléchargement
La page de téléchargement permet de récupérer le liens du dépôt. ([ici](https://packages.debian.org/bullseye/amd64/nano/download))

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/8ebd3029-fca2-4775-a807-8c2eb50b8b31' /> </p>

Si on souhaite ne pas utiliser le dépot allemand (de), on peut remplacer `ftp.de.debian.org/debian` par le depot francais (fr) `ftp.fr.debian.org/debian`.

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/50ff7041-51e6-4722-a3d6-981e764608d1' /> </p>

```
deb http://ftp.de.debian.org/debian bullseye main 
deb http://ftp.fr.debian.org/debian bullseye main 
```


<br />



----------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Fonctionnement de base d'un dépôt

#### A. Sources.list
```
deb http://ftp.fr.debian.org/debian bullseye main
```

```
deb                              : Paquet pour Debian
http://ftp.fr.debian.org/debian/ : URL de base du dépôt
bullseye                         : version de la distribution
main                             : Catégorie de paquet. (Logiciel ou pilote Libre uniquement) 
```

#### B. Arborescence de base
Lorsqu'on ouvre le liens du [DEPOT](http://ftp.fr.debian.org/debian/`), on peut observer des dossiers et des fichiers.

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/abd3df60-fcbd-47ba-b805-1b28e86b5980' /> </p>


#### C. Mécanisme APT
Le programme apt va taper l'URL du Dépôt pour aller dans `dists` puis la `version` et va accéder au `Catégories`.

Si le paquet est dans une catégorie déclarer dans le fichier sources.list il va le télécharger.

<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/6a8bdce0-e5be-46c4-94c1-5fda51e0d2c2' /> </p>

#### D. Les catégories
##### 1. Présentation
<p align='center'> <img src='https://github.com/MarcJaffre/Linux/assets/35907/dd066ff0-f2a9-484b-9cfd-aeec63594ae1' /> </p>

##### 2. sources.list
Les catégories `contrib` et `non-free` ne sont pas présent dans le fichier sources.list.

La catégorie `non-free` contient les logiciels propriétaires qui peuvent être des pilotes. Si aucun pilote libre existe, l'utilisation de la catégorie non-free est indispensable pour que le matériel marche.


Avant:
```
deb http://ftp.fr.debian.org/debian bullseye main contrib non-free
```
Après:
```
deb http://ftp.fr.debian.org/debian bullseye main contrib non-free
```
