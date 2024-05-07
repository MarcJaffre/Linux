---------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation de Debian 11 </p>

---------------------------------------------------------------------------------------------------------------------------
### I. Information Générale
#### A. Présentation de la distribution
```
- Système d'exploitation     : Debian
- Version de la distribution : Bullseye (11)
```

<br />

#### B. Recommandation (CF. Wikipedia Debian)

| Type d'installation | RAM (Min.) | RAM (Rec.) | Stockage |
| ------------------- | ---------- | ---------- | -------- |
| Mode Console        |	256 Mo     | 512 Mo     | 2 Go     |
| Mode Graphique      |	1 Go       | 2 Go       | 10 Go    |


#### C. Mode de démarrage
```
Le démarrage en MBR requiert une partition Boot et le démarrage est actif sur la partition Boot.
Le démarrage en EFI requiert une partition EFI  et le démarrage est actif sur la partition EFI.
```

<br />

---------------------------------------------------------------------------------------------------------------------------
### II. Création de la machine virtuelle

<br />

---------------------------------------------------------------------------------------------------------------------------
### III. Installation de debian (Partie 1)
#### A. Définir le mode d'installation
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/02454c7f-72cd-425b-9de0-af42f4f6cdcb' /> </p>

#### B. Sélectionner la langue de l'installateur
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/4b7faf28-68d7-4b87-ba0b-c08f13b990ba' /> </p>

#### C. Situation Géographique
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/ca05942d-41ba-483d-9702-ca37aafd2ed6' /> </p>

#### D. Clavier
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/1364a050-a3ad-49ca-83d5-b5fb83363cd0' /> </p>

#### E. Définir le nom de la machine
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/f56498d6-5b0b-4b9e-b10e-0134f1f80026' /> </p>

#### F. Définir le nom de domaine de la machine
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/0036ebf8-a8fd-4860-89cd-c2687a963c41' /> </p>

#### G. Définir le nom de domaine de la machine
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/0036ebf8-a8fd-4860-89cd-c2687a963c41' /> </p>

#### H. Définir le mot de passe Root
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/9c779df0-342f-4843-8ff1-c42abb647b4f' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/a09b7cb9-a270-486d-a767-90568ce8beb1' /> </p>

#### I. Définir le nom visuel de l'utilisateur
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/8da86feb-8794-4111-a97d-289ea8fa3537' /> </p>

#### J. Définir le nom d'utilisateur réel
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/c7e11f8a-f510-437a-8f6d-617ae8b6c893' /> </p>

#### K. Définir le mot de passe
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/fb14928e-83d4-4a5b-8686-5996b30530f3' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/777e1f78-80eb-40ac-ad06-f2721b9cf6af' /> </p>

<br />
<br />

---------------------------------------------------------------------------------------------------------------------------
### IV. Installation de debian (Partie 2)
#### A. Présentation du partitionnement
##### 1. Base de fonctionnement
La distribution Linux requiert une partition de démarrage (EFI) puis une partition Système (/) et une partition SWAP pour pouvoir au minimum se lancer.

Le démarrage sera présent dans la partition ESP (EFI) de Linux.

##### 2. LVM
La technologie LVM permet de pouvoir redimensionnée à chaud une partition. (Agrandir, augmenter)

#### 3. Exemple de partitionnement
```
/dev/sda  : Disque-Dur
 > sda1   : La partition primaire EFI pèse 512M et est au format Vfat (ESP)
 > sda2:  : La partition primaire LVM pèse le reste du volume disque 
```

```
LVM:
 - SYSTEM : La partition diposera de 8 Go d'espace de stockage, elle sera formater en EXT4 et le point de montage sera la racine (/)
 - SWAP   : La partition de fichier d'échange fera 2 Go et aucun point de montage.
 - HOME   : La partition diposera de 4 Go d'espace de stockage, elle sera formater en EXT4 et le point de montage sera la racine (/home)
          : La partition HOME est le dossier de l'ensemble des utilisateurs (Hors root)
```

<br />



#### B. Création des partitions
##### 1. Mode Manuel
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/79986f61-2766-448f-a73c-61f0e7ef42b9' /> </p>

##### 2. Création de la table de partition GPT
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/378abdba-0157-4c18-a750-74f6493d9919' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/31d62a99-18dc-43c3-83a3-48a32ad8c4e8' /> </p>

##### 3. Création des partitions
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/a09a241e-a153-4e5c-b7cb-5ad727d93693' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/41ffa333-1906-49bd-840d-861e0fa683ce' /> </p>


##### 4. Création de la partition Boot
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/bc4156e9-eccb-4f95-a216-d267d8edb6c2' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/3fd1d14a-1943-40a8-b491-56459aada7fe' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/c200ad77-6b7b-4432-9d6f-fcf56b857a9e' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/9bdfa3d9-8d0b-4cfe-b16d-7ee95320b86d' /> </p>

##### 5. Création de la partition SWAP
<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/7a42586f-ab06-4d1e-9648-c07a08ed9399' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/3fd1d14a-1943-40a8-b491-56459aada7fe' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/c200ad77-6b7b-4432-9d6f-fcf56b857a9e' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/755ff8c1-d8ab-418a-b9c6-bafee6b26408' /> </p>


##### 6. Création de la partition  LVM

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/3fd1d14a-1943-40a8-b491-56459aada7fe' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/c200ad77-6b7b-4432-9d6f-fcf56b857a9e' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/6d70924c-5237-407e-91ea-7b99e99fe4bd' /> </p>

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/6d5e1f46-a2b4-4d3f-8aa0-56b673d05e29' /> </p>


##### 7. 
##### 8. 
##### 9. 
##### 10. 
##### 
##### 
##### 
##### 
##### 
##### 
##### 
##### 
##### 






















