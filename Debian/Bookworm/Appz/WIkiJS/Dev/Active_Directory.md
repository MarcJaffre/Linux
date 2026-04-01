---------------------------------------------------------------------------------------------------------------------
# <p align='center'> Connexion Ldap dans WikiJS </p>
---------------------------------------------------------------------------------------------------------------------
## I. Serveur
### A. Active Directory
Le domaine se nomme `Studi.local`.

#### 1. OU

#### 2. Groupe
Crée les Groupes `Wiki_User` et `Wiki_Admin` dans `Users`.

#### 3. User LDAP
Créer un Compte `LDAP` dans `Users`.

#### 4. User
Créer un Compte `Marc` dans `Users` puis ajouter l'utilisateur dans le groupe `Wiki_Admin` ou `Wiki_User` selon si c'est un utilisateur ou un admin.

<br />

---------------------------------------------------------------------------------------------------------------------
## II. WikiJS
### A. Groupe / Permission
Sans l'ajout de groupe `Wiki_User` et `Wiki_Admin` et des permissions, ses groupes ne servent à rien.

Pour permettre l'ajout de permission, il faut créer un groupe local `Wiki_User` avec des droits de **Lectures**.

Pour permettre l'ajout de permission, il faut créer un groupe local `Wiki_Admin` avec des droits d'**écriture**.


### B. Configuration de la stratégie
#### 1. Nom d'affichage
Définir la valeur sur `Active Directory`.

#### 2. Admin Bind DN
Ce paramètre est le chemin qui mène au compt AD qui permettra à WikiJS de s'authentifier.

Définir la valeur sur `CN=LDAP,CN=Users,DC=studi,DC=local`

#### 3. Search Base
Ce paramètre est le chemin de base pour recherche dans l'AD. En prenant la racine, on autorise la recherche dans toute l'AD.

Définir la valeur sur `DC=studi,DC=local`.

#### 4. Search Filter
Ce paramètre 

Définir la valeur sur `(userPrincipalName={{username}})`.

#### 5. Unique ID Field Mapping
Ce paramètre 

Définir la valeur sur `sAMAccountName`.

#### 6. Email Field mapping
Ce paramètre permet

Définir la valeur sur `userPrincipalName`.


#### 7. Display Name Field Mapping
Ce paramètre permet de récupérer le nom d'affichage dans l'AD dans le champs `displayName`.

Définir la valeur sur `displayName`.





<br />

### B. Map Groups
Permettre de mapper les groupes de l'AD et les groupes dans WikiJS. (Interopérabilité)

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
