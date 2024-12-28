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

#### E. Ajouter les permissions au dossier `TEST`

| Groupe  | Permission          |
| ------- | ------------------- |
| TEST_RO | Lecture seule       |
| TEST_RW | Lecture et écriture |

![image](https://github.com/user-attachments/assets/a34b8dc2-d37f-4250-9aba-d82b1b5f43f0)


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
Ouvrir l' `Explorateur de fichiers` puis ouvrez votre partage > `clique droit` > `Propriété` . (Il est nécessaire d'avoir les pleins droits pour la maintenance.

Par défaut, le propriétaire est `Admin` et le groupe propriétaire est `Administrators`.

![image](https://github.com/user-attachments/assets/05392c76-b70c-4d93-a44d-25489df9e376)

##### 3. Problème de la configuration par défaut
Par défaut le groupe spécial `chacun` donne tout les droits à l'ensemble des utilisateurs. Le groupe `Chacun` est l'équivalant à `Tout le monde` dans Microsoft Windows.

Je recommande de le supprimé

##### 4. Ajouter les groupes
Ajouter les groupes et les droits correspondant.
![image](https://github.com/user-attachments/assets/8cbf9d4a-be8c-4fa9-a822-d14516aea915)

![image](https://github.com/user-attachments/assets/47d108cf-614e-4727-949f-216abc6d4b40)

##### 5. Auditer les accès
Cliquer sur le bouton `Permissions effectives` puis cliquer le `crayon` et choisissez un utilisateur qui fait partie d'un des groupes suivants:  `TEST_RO` et `TEST_RW`.

Ceci permet de valider l'accès.
