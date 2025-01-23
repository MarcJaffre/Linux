--------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Heroic Games Launcher </p>

--------------------------------------------------------------------------------------------------------------------------------
## I. Installation
### A. Télécharger Launcher
Aller sur le Github de [Heroic Games Launcher](https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases), puis Choisir le fichier d'installation Debian. (`heroic_X.X.X_amd64.deb`)

### B. Installation
Lancer le fichier debian et installer le paquet ou via la ligne de commande. (`sudo dpkg -i heroic_X.X.X_amd64.deb`)

<br />

--------------------------------------------------------------------------------------------------------------------------------
## II. Prise en main
### A. Options
#### 1. Général
#### 1. Choose App Language & Theme
Sélectionner la langue `Française` et le thème `Dracula` .

#### 2. Fonctionnalité
| Statut  | Description                                                                      | 
| ------- | -------------------------------------------------------------------------------- |
|   [X]   | Vérifier au démarrage si une version plus récente d'Heroic est disponible        |
|   [X]   | Mettre à jour les jeux à jour automatiquement                                    |
|   [X]   | Minimiser dans la barre des tâches                                               |
|   [X]   | Minimiser Heroic après le lancement du jeu                                       |
|   [X]   | Ajouter automatiquement les jeux au menu Démarrer                                |

#### 2. Paramètres de jeu par défaut (Wine)
Sélectiooner `Proton - Proton-GE-latest`. (`Gestion de Wine` si aucune version)

| Statut  | Description                                                                      | 
| ------- | -------------------------------------------------------------------------------- |
|   [X]   | [Nvidia] Installation / Mise à jour automatique de DXVK/NVAPI dans le préfixe    |

#### 3. Avancé
| Statut  | Description                                                                      | 
| ------- | -------------------------------------------------------------------------------- |
|   [X]   | Utiliser UMU comme moteur de Proton (Nouveau projet)                             |

#### 4. Informations Systèmes
### B. Gestions de Wine
#### 1. Wine-GE
La dernière version date de 2024. DECONSEILLER
#### 2. Proton-GE
Prendre la dernière version pour profiter des derniers correctifs.

<br />

--------------------------------------------------------------------------------------------------------------------------------
## III. Jeux-vidéo
### A. Battle.Net
#### 1. Installateur
Aller dans `Bibliothèque` > `Ajouter un jeu` > `Battle.net-setup.exe` > `Lancer l'installateur en Premier`. 

Faire l'`installation`  et lancer Battle.net .

#### 2. Sélectionner l'exécutable
L'installation c'est bien terminé, il suffit de choisir l'exe de Battle.net
```
Titre: Battle.net
Exe  : /home/marc/Games/Heroic/Prefixes/default/Battle.net/pfx/drive_c/Program Files (x86)/Battle.net/Battle.net Launcher.exe
```

C'est terminé
