---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation et inscription de la machine RedHat </p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
```
- Installation du système d'exploitation
- Inscription de la licence RedHat
```

<br />
<br />


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Tutorial d'installation d'un serveur RedHat

### A. Lancer l'installation

<br />

### B. Choisir la langue
![Langue](https://github.com/Drthrax74/Linux/assets/35907/c3b7a7fe-ec10-4040-9f76-5c31626dbe74)

<br />

### C. Menu de sélection
![Resume de l'installation](https://github.com/Drthrax74/Linux/assets/35907/20bd282d-3b3d-48da-9512-3e7924659cd0)

<br />

### X. Sélection de logiciels
Choisir `Minimal`pour l'environnement de base et ne pas cocher de case pour les paquets supplémentaires.

![image](https://github.com/Drthrax74/Linux/assets/35907/c9d96681-b0ff-4c29-b011-c663e5979442)

<br />

### X. Installation de destinations
Sélectionner le disque-dur où sera installé RedHat puis faire `Fait`.

![image](https://github.com/Drthrax74/Linux/assets/35907/69b46ddc-6846-4c6d-b563-58afd071dd82)

Ensuite cliquer sur `Libérer l'espace` .

![image](https://github.com/Drthrax74/Linux/assets/35907/5d2a6f75-855e-4080-bed6-f8d6f3d2aeb0)

Pour supprimer l'ensemble des partitions cliquer sur `Tout Supprimer` puis sur `Récupérer l'espace`.

![image](https://github.com/Drthrax74/Linux/assets/35907/7fb12b48-4c25-455d-8b9d-12687a412e9a)

<br />

### X. Réseau & nom d'hôte
Remplir le champs `Nom d'hôte` et faire `Appliquer` et ensuite il suffit de définir la politique d'adressage IPv4. (DHCP ou static)

Pour valider les modifications, il suffit de cliquer sur `FAIT`.

![image](https://github.com/Drthrax74/Linux/assets/35907/d931b97b-25c2-4256-8a5e-3f73771d1606)

<br />

### X. Paramètres Utilisateur
Il suffit de suivre le processus pour le root et l'utilisateur.

Puis cliquer sur `Commencer l'installation`.

<br />
<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Interface réseau
### A. Afficher les devices et connections
```bash
clear;
nmcli connection show;
nmcli device show;
```

### B. Configuration du réseau
```
nmcli connection delete ens18;
nmcli connection add type ethernet con-name ens18-new ifname ens18;

nmcli connection modify ens18-new ipv4.addresses 192.168.200.43/24;
nmcli connection modify ens18-new ipv4.gateway   192.168.200.1;
nmcli connection modify ens18-new ipv4.dns       192.168.200.1;
nmcli connection modify ens18-new ipv4.method    manual;

nmcli connection up ens18-new;
```

### C. Vérification
#### 1. Afficher le périphérique
Ce mode d'affichage permet de la configuration de manière simple.
```bash
clear;
nmcli device show ens18;
```

#### 2. Afficher la connexion
Ce mode d'affichage permet de voir chaque paramètres de la connection
```bash
clear;
nmcli connection show ens18-new;
```




<br />


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## IV. Subscription
### A. Panel de subscription
```
https://access.redhat.com/management/subscriptions
```

### B. Information sur la licence 

![image](https://github.com/Drthrax74/Linux/assets/35907/6e19cbba-53d4-4080-9fd9-031e2ab01e51)

![image](https://github.com/Drthrax74/Linux/assets/35907/5dfc59a0-6cf0-48f0-9e64-39ba6b6f2e3f)

<br />

### C. Gestionnaire de licence
#### 1. Etat de l'inscription à Redhat
```bash
subscription-manager list --available
```

![image](https://github.com/Drthrax74/Linux/assets/35907/0470b4fb-c91b-4315-8153-723d59bd3eac)

<br />

#### 2. Inscrire la machine à Redhat
```bash
subscription-manager register
subscription-manager register --username <Identifiant de connexion> --password <PASSWORD> --auto-attach
subscription-manager register --username <EMAIL> --password <PASSWORD> --auto-attach
```

![image](https://github.com/Drthrax74/Linux/assets/35907/28a31abf-9b3d-4343-8f6d-ebf8c3843e58)

![image](https://github.com/Drthrax74/Linux/assets/35907/8e9c4451-d45b-400a-b52e-b21f20ef944b)

![image](https://github.com/Drthrax74/Linux/assets/35907/8a14e45c-0ea4-4f7a-a671-d11a2e6234f0)

<br />

#### 3. Rafraichir
```bash
subscription-manager refresh
```

#### 4. Ajouter le système à une licence spécifique (Pool)
```bash
subscription-manager attach --pool=2c94738b8e14af59018e1af216be07bc
```
![image](https://github.com/Drthrax74/Linux/assets/35907/0f88a8e5-b5dd-4227-aeef-2b7cd05116e6)

<br />

#### 5. Désinscrire une licence
```bash
subscription-manager unregister
```

![image](https://github.com/Drthrax74/Linux/assets/35907/b129de62-13be-4bef-84a5-70228dfb585f)


#### 6. Machine inscrite
![image](https://github.com/Drthrax74/Linux/assets/35907/8ff6d8bf-9a36-4e36-a309-7ab56af0c5ad)

![Website System RedHat](https://github.com/Drthrax74/Linux/assets/35907/9378387f-b79d-4700-86a8-dca1454b132d)




