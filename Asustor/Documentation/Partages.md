-----------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Gestions des droits de partage </p>

-----------------------------------------------------------------------------------------------------------------------------------------------
### I. Création d'un utilisateurs, d'un groupe et d'un partage
#### A. Création d'un Utilisateur
Aller dans le menu `Contrôle d'Accès` > `Utilisateurs Locaux` > `Ajouter`.

#### B. Création de Groupe
Aller dans le menu `Contrôle d'Accès` > `Groupes Locaux` > `Ajouter`. Créer un groupe `TEST_RO` et `TEST_RW`.


#### C. Ajouter de l'utilisateur dans les Groupes
Aller dans le menu `Contrôle d'Accès` > `Groupes Locaux` > Sélectionner votre groupe > `Editer`.

#### D. Création du Partage
Aller dans le menu `Contrôle d'Accès` > `Dossiers Partagés` > `Ajouter` et donner le nom `TEST`.

#### E. Ajouter les permissions 

| Groupe  | Permission -------- |
| ------- | ------------------- |
| TEST_RO | Lecture seule       |
| TEST_RW | Lecture et écriture |

<br />

-----------------------------------------------------------------------------------------------------------------------------------------------
### II. Gestion des permissions
#### A. Sans ACL
Ne pas disposer des ACL, ont ne peut que gérer les droits sur le partage et pour les systèmes d'exploitation Microsoft est trop permissive.

![image](https://github.com/user-attachments/assets/d7b7a6c9-7859-493a-ba4c-0611bd55ff59)

#### B. Avec ACL
##### 1. Activer les ACL au partage
Aller dans le menu `Contrôle d'Accès` > `Dossiers Partagés` > sélectionner votre partage > `Editer` > onglet `Windows ACL` > Cocher `Activer Windows ACL`.

Aucun changement au niveau du chmod sur le dossier `TEST`.

![image](https://github.com/user-attachments/assets/e6a140c0-56a5-47ab-a29b-f2f0cb505baf)


##### 2. Editer les permissions
Ouvrir l' `Explorateur de fichiers` puis ouvrez votre partage. (Il est nécessaire d'avoir les pleins droits pour la maintenance.

##### 3. 
