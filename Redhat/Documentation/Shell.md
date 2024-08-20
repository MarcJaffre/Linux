------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> SHELL </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
```
Stephen Bourne      : Shell
Bourne Againe Shell : bash
David Korn          : ksh
C Shell             : Cshell / tcsh (Langage C)
```

<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Utilisation du Shell (base)
#### A. TTY
##### 1. Présentation
Une console linux est composé de plusieurs instance TTY qui sont concrétement des consoles pour interargir avec le système.

Un Utilisateur à comme prefixe `$` 

![image](https://github.com/Drthrax74/Linux/assets/35907/650bf161-0927-4474-9876-99088184da66)

Un administrateur à comme préfixe `#`.

![image](https://github.com/Drthrax74/Linux/assets/35907/36625fdc-5fc0-4e05-b8cf-f5ab6f981ef0)


##### 2. Bascule de console TTY
Pour basculer d'une console Linux (TTY), il suffit de faire un raccourcis clavier dans le terminal `CTRL + ALT` et `F1 à F9`.

![image](https://github.com/Drthrax74/Linux/assets/35907/1a6354d7-0b6d-4576-bb7b-079e4de84058)

![image](https://github.com/Drthrax74/Linux/assets/35907/dccb3632-9ddf-4077-9a30-7094a8103f01)

<br />

#### B. Invite de commande
Pour modifier la mise en forme de l'invite de commande.
```bash
echo $PS1
```

```bash
PS1="[\u@\h \W \A]: "
```

```
# \u: nom d'utilisateur
# @ : Séparateur
# \h: Nom de machine
# \W: Nom de dossier courant
# \A: Heure de format (24H)
```

![image](https://github.com/Drthrax74/Linux/assets/35907/50333613-9563-4b64-926b-f5bf6a0a9e6c)

![image](https://github.com/Drthrax74/Linux/assets/35907/6429a1af-fc57-4880-8a9f-ec8143a6e0e0)

<br />

#### C. Commande de base
```
pwd      : Permet de connaitre l'emplacement actuel de la console
ls       : Lister le contenu d'un dossier.
cd       : Se déplacer dans l'arborescence linux
ifconfig : Afficher les interfaces réseaux
history  : Historique des commandes (1000 dernières commandes)
```
<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Utilisation du Shell (Avancés)
#### A. History
##### 1. Afficher l'historique
Il faut être dans le dossier de l'utilisateur.
```
cat .bash_history
```
![image](https://github.com/Drthrax74/Linux/assets/35907/57a12037-6672-48a1-a5e3-fd102a7e133a)

##### 2. Afficher les 5 dernières commandes
```
history 5
```

#### 3. Rechercher dans l'historique
Si le terme de recherche existait plusieurs fois, faire CTR+R pour continuer la rechercher.
```
CTRL + R
PS1
CTRL + R
```

<br />

#### C. Raccourcis Clavier
```
CTRL + l: Nettoyer l'écran
CTRL + C: Tuer la commande en cours
CTRL + d: Quitter le Shell en cours

CTRL + A: Place le curseur en début de ligne
CTRL + E: Place le curseur en fin   de ligne
CTRL + _: Annuler la dernière modification

CTRL + w             : Supprimer le mot derrière le curseur
CTRL + k             : Supprimer tous les mots devant   le curseur
CTRL + x + Backspace : Supprimer tous les mots derrière le curseur

ALT  + f: Sauter de mot en mot en avant
ALT  + b: Sauter de mot en mot en avant
```

<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### IV. Gestion de fichier
#### A. lister le contenu
```
ls
ls -a
ls -lag --color=auto
```
#### B. Se déplacer dans l'arborescense
```
cd $HOME
cd /usr/bin
```

#### C. Manipuler les fichiers
```
mkdir TEST
mkdir -p TEST/DOCUMENTS/
touch TEST/DOCUMENTS/marc.txt
cp TEST/DOCUMENTS/marc.txt TEST/DOCUMENTS/marc.txt.old
rm TEST/DOCUMENTS/marc.txt
mv TEST/DOCUMENTS/marc.txt.old TEST/DOCUMENTS/marc.txt
```

#### D. Lister
```
ls marc* : Lister les fichiers dont le nom début par marc
ls *txt  : Lister les fichiers dont le nom se finit par text
ls *arc* : Lister les fichiers dont le nom contient arc
ls m?    : Lister les fichiers dont le nom commence par m et dispose d'un second caractère
ls m???  : Lister les fichiers dont le nom commence par m et dispose de 3 caractères après
ls m[123]: Lister les fichiers dont le nom est m1, m2 et m3
ls m[1-3]: Lister les fichiers dont le nom est m1, m2 et m3
```

<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### V. Entrées / Sorties / Redirections et les Tubes
#### A. Description d'une entrée / Sortie
Une entrée est le clavier et la sortie sont soit des messages standard ou d'erreur.
```
- Entrée Standard: 0 (Clavier)
- Sortie Standard: 1 (Console)
- Sortie Erreur  : 2 (Console)
```

#### B. Redirection
```
ls >  file1;
ls >> file1;
```

```
cat < fin;

cat > fin <<END
>Ajout de contenu dans le fichier
>END
cat fin;
```

#### C. Tubes (Pipe)


<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### VI. Editeur de Texte VI
La commande `vimtutor` permet d'ouvrir la fenêtre de tutorial 
#### A. Modes
```
Echap   : Permet de basculer entre les modes
 -> :q! : Quitter sans sauvegarder
 -> :w  : Sauvegarder (w marc : sauvegarder dans un autre fichier)  
 -> :wq : Sauvegarder et Quitter
 -> i   : Insert
 -> u   : Annuler modification 
 -> o   : Ajouter du contenu en dessous de la ligne courante
 -> O   : Ajouter du contenu au dessus  de la ligne courante
 -> R   : Mode Remplacement de texte
 -> /   : Rechercher un terme
         -> n : Occurence Suivant
         -> N : Occurence Précédent
 -> cw  : Remplacer le mot (Change Word)
 -> dw  : Supprimer le mot (droite du curseur)
 -> dd  : Supprimer la ligne courante
 -> yy  : Copier
 -> p   : Coller
 -> x   : Supprimer le caractère à droite du curseur
```
