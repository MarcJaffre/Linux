---------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation de Debian 11 </p>

---------------------------------------------------------------------------------------------------------------------------
### I. Information Générale
#### A. Présentation de la distribution
```
- Système d'exploitation     : Debian
- Version de la distribution : Bullseye (11)
```

#### B. Recommandation (CF. Wikipedia Debian)

| Type d'installation | RAM (Min.) | RAM (Rec.) | Stockage |
| ------------------- | ---------- | ---------- | -------- |
| Mode Console        |	256 Mo     | 512 Mo     | 2 Go     |
| Mode Graphique      |	1 Go       | 2 Go       | 10 Go    |

<br />

---------------------------------------------------------------------------------------------------------------------------
### II. Création de la machine virtuelle
#### A. Caractéristique de la machine
Un Système linux en serveur est plus léger qu'un linux bureautique.
```
- Système d'exploitation : Debian 12
- Processeur (CPU)       : 2 Core
- Mémoire-Vive (RAM)     : 1 Go
- Stockage (HDD0)        : 10 Go
- Type de Réseau         : Mode Pont
```

<br />

---------------------------------------------------------------------------------------------------------------------------
### III. Installation de Debian (Partie 1)
#### A. Définir le mode d'installation
Le mode `Graphical Install` permet d'avoir une installation avec la prise en charge de la souris.

Le mode `Install` est une installation en mode clavier sans souris.

<p align='center'> <img src='https://github.com/user-attachments/assets/13fc67c4-2d99-47c7-b558-6c4f432a2a0d' /> </p>
<br />

#### B. Sélectionner la langue de l'installateur
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/4b7faf28-68d7-4b87-ba0b-c08f13b990ba' /> </p>
<br />

#### C. Situation Géographique
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/ca05942d-41ba-483d-9702-ca37aafd2ed6' /> </p>
<br />

#### D. Clavier
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/1364a050-a3ad-49ca-83d5-b5fb83363cd0' /> </p>
<br />

#### E. Définir le nom de la machine
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/f56498d6-5b0b-4b9e-b10e-0134f1f80026' /> </p>
<br />

#### F. Définir le nom de domaine de la machine
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/0036ebf8-a8fd-4860-89cd-c2687a963c41' /> </p>
<br />

#### G. Définir le nom de domaine de la machine
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/0036ebf8-a8fd-4860-89cd-c2687a963c41' /> </p>
<br />

#### H. Définir le mot de passe Root
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/9c779df0-342f-4843-8ff1-c42abb647b4f' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/a09b7cb9-a270-486d-a767-90568ce8beb1' /> </p>
<br />

#### I. Définir le nom visuel de l'utilisateur
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/8da86feb-8794-4111-a97d-289ea8fa3537' /> </p>
<br />

#### J. Définir le nom d'utilisateur réel
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/c7e11f8a-f510-437a-8f6d-617ae8b6c893' /> </p>
<br />

#### K. Définir le mot de passe
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/fb14928e-83d4-4a5b-8686-5996b30530f3' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/777e1f78-80eb-40ac-ad06-f2721b9cf6af' /> </p>

<br />
<br />

---------------------------------------------------------------------------------------------------------------------------
### IV. Installation de Debian (Partie 2)
#### A. Présentation
Le guide suivant apprend l'installation de Debian sans utiliser la technologie LVM.

Pour un serveur, il est recommandé en LVM.

#### X. Méthode de partitionnement
Le partitionnement se fera en manuel.

<p align='center'> <img src='https://github.com/user-attachments/assets/03880a02-a294-4635-a1e6-39179da633c0' /> </p>
<br />

#### X. Partitionner les disques
Le disque-dur se nomme `sda`
<p align='center'> <img src='https://github.com/user-attachments/assets/1ca2210f-b113-4956-9de9-9e1a5f14a1b9' /> </p>

#### X. Partition de démarrage
##### 1. Créer la partition
Sélectionner `l'espace libre` > `Entrer` > `Créer une noouvelle partition` > `Taille: 512Mo` > `Début du disque` > .

<p align='center'> <img src='https://github.com/user-attachments/assets/bfec2d16-4fd6-43ed-8944-de127b24ebd2' /> </p>

<p align='center'> <img src='https://github.com/user-attachments/assets/4703b4fa-c366-4ba4-8df4-2eea5e770708' /> </p>

<p align='center'> <img src='https://github.com/user-attachments/assets/9606a7c0-f398-4365-aa6a-f3285cb4171f' /> </p>

##### 2. Partition de démarrage EFI
Sélectionner `Utiliser comme` > `Partition système EFI` > `Fin de paramètrage de cette partition`. (ESP = EFI)

<p align='center'> <img src='https://github.com/user-attachments/assets/2238542b-5999-4814-ae34-fdccaa4685f6' /> </p>

<p align='center'> <img src='https://github.com/user-attachments/assets/a77ef429-4b28-4c78-9524-833fc8782fec' /> </p>

<p align='center'> <img src='https://github.com/user-attachments/assets/039a7f8a-b6fa-479c-8425-f8374cb59f4c' /> </p>
<br />

#### X. Création de la partition SYSTEM
La partition système est celle qui correspond à Debian. Un système linux en **mode serveur** est très peu gourmand en espace de stockage.

Il est fort utile de définir un `Nom` et un `Label` pour l'identifier en ligne de commande. (Dans mon cas, j'ai choisis `SYSTEM`)

<p align='center'> <img src='https://github.com/user-attachments/assets/b860b871-3fe2-4da0-ac4c-63ee9d6c169c' /> </p>

<p align='center'> <img src='https://github.com/user-attachments/assets/a6c2dc01-2270-4b7b-8f23-fae460cbe331' /> </p>

<p align='center'> <img src='https://github.com/user-attachments/assets/509d9c59-c640-4fd7-ab6c-412fa5eb62ae' /> </p>
<br />

#### X. Création de la partition HOME
La partition HOME permet de séparer le système des données utilisateur. L'utilisation de l'espace disque de celle-ci dans le cas d'un serveur est souvent nul.

<p align='center'> <img src='' /> </p>
