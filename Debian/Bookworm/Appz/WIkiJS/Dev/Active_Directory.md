---------------------------------------------------------------------------------------------------------------------
# <p align='center'> Connexion Ldap dans WikiJS </p>
---------------------------------------------------------------------------------------------------------------------
## I. Serveur
### A. Active Directory
Le domaine se nomme `Studi.local`.

#### 1. Groupe
Crée les Groupes `Wiki_User` `Wiki_Admin` dans `Users`. 

#### 2. User LDAP
Créer un Compte `LDAP` dans `Users`.

#### 3. User
Créer un Compte `Marc` dans `Users` puis ajouter l'utilisateur dans le groupe `Wiki`.

<br />

---------------------------------------------------------------------------------------------------------------------
## II. WikiJS
### A. Groupe
Crée un groupe local `Wiki_User` avec des droits de Lectures.

Crée un groupe local `Wiki_Admin` avec des droits de Lectures.

### B. Configuration de la stratégie
#### 1. Nom d'affichage
Définir la valeur sur `Active Directory`.

#### 2. Admin Bind DN
Définir la valeur sur `CN=LDAP,CN=Users,DC=studi,DC=local`

#### 3. Search Base
Définir la valeur sur `DC=studi,DC=local`.

#### 4. Search Filter
Définir la valeur sur `(mail={{username}})`.

#### 5. Unique ID Field Mapping
Définir la valeur sur `sAMAccountName`.

#### 6. Email Field mapping
Définir la valeur sur `userPrincipalName`.

#### 7. Display Name Field Mapping
Définir la valeur sur `displayName`.

<br />

### B. Map Groups
Activer le Map Groups.

#### 1. Group Search Base
Définir la valeur sur `CN=Wiki,CN=Users,DC=studi,DC=local`.

#### 2. Groupe Search Filter
Définir la valeur sur `(member={{dn}})`.

#### 3. Group DN Property
Définir la valeur sur `dn`.


### C. Inscription
Définir le nom de domaine `studi.local` et attacher au groupe `Wiki_User`.

Il ne reste plus qu'a s'authentifié


Source: [ici](https://lahousse.net/wp-content/uploads/2024/01/CR-Wik.JS.pdf)
