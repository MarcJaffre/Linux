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
```
- Système d'exploitation : Debian 12
- Processeur (CPU)       : 2 Core
- Mémoire-Vive (RAM)     : 1 Go
- Stockage (HDD0)        : X Go
- Type de Réseau         : Mode Pont
```

<br />

---------------------------------------------------------------------------------------------------------------------------
### III. Installation de Debian (Partie 1)
#### A. Définir le mode d'installation
<p align='center'> <img src='' /> </p>
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
Le partitionnement suivant n'utilise pas la technologie LVM. Sans le LVM, le redimensionnement des partitions à chaud est très compliquer. (requiert arrêt de la machine)

#### B. Création de la table de partition

#### C. Création de la partition de démarrage
##### 1. Mode MBR
<p align='center'> <img src='' /> </p>

##### 2. Mode EFI
<p align='center'> <img src='' /> </p>

#### D. Création de la partition SYSTEM
La partition système est celle qui correspond à Debian. Un système linux de type serveur sous Debian est très léger, donc il n'est pas nécessaire de lui attribué un espace conséquent.

<p align='center'> <img src='' /> </p>

#### E. Création de la partition HOME
La partition HOME permet de séparer le système des données utilisateur. L'utilisation de l'espace disque de celle-ci dans le cas d'un serveur est souvent nul.

<p align='center'> <img src='' /> </p>
