----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de GLPI sous Debian </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Information
### A. Présentation
Le serveur Debian sera dans un réseau NAT dans mon exemple et une redirection de port permettant d'y accéder depuis la machine hôte.
### B. Virtualbox
#### 1. Création d'un réseau NAT
Création du réseau `192.168.10.0/24`.

![image](https://github.com/user-attachments/assets/bd62c64f-4e1f-47c9-952c-47bb9eda5163)

![image](https://github.com/user-attachments/assets/5923dd6d-ba17-43fc-93d4-f64112af3031)

#### 2. Création de la Machine Virtuelle
```
- Processeur     : 2 Core
- Mémoire-vive   : 1 Go
- Stockage       : 16 Go
- Enable EFI     : Non (Eviter Ecran Gris)
```

#### 3. Configuration du Réseau pour la VM
![image](https://github.com/user-attachments/assets/38a46955-8950-4f35-9f13-995f0c6f9a24)

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Configuration de la machine
### A. Ouvrir la session
Par défaut l'utilisateur crée lors de l'installation n'est pas dans le groupe `27` (sudo) et donc peut pas utiliser `sudo`, ce qui oblige d'utilise `su -` pour ouvrir la session `root`.

### B. Interfaces Réseaux
#### 1. Information
L'interface se nomme `enp0s3`.

Son Adresse IPv4 est `192.168.10.6`.

La passerelle par défaut `192.168.10.1`. (Default permet de reconnaitre la passerelle par défaut)

Le serveur DNS est `192.168.0.1` (Routeur Physique)

![image](https://github.com/user-attachments/assets/2ecdd07a-cc4c-4b57-bba5-32a0c85d5a63)

![image](https://github.com/user-attachments/assets/851eb216-56b6-4bf6-84eb-e8bf212b7c6a)

![image](https://github.com/user-attachments/assets/7af3856a-c0b3-461b-b007-ac7437408267)

#### 2. IP en static
Taper la commande `nano /etc/network/interfaces`, editer le fichier. (CTRL+O: Enregistrer sous | Entrer | CTRl+X : Quitter)

Puis il est nécessaire de redémarrer le service `networking` pour que la configuration s'applique et on vérifie si le service n'est pas en erreur. (Q pour quitter le mode Statut)

Il ne reste plus qu'a vérifier si tout marche avec la commande `ping -c 3 google.fr`. (3 Requêtes)
```
# Demarrer interface au demarrage
auto enp0s3

# Activer la fonction deco/reco de l-interface
allow-hotplug enp0s3

# Mode Static
iface enp0s3 inet static
  # CIDR
  address 192.168.10.5/24
  # Passerelle
  gateway 192.168.10.1
  # DNS
  dns-nameservers 192.168.10.1 8.8.8.8
```

![image](https://github.com/user-attachments/assets/b79b4335-87c8-4771-8757-62e229cf50eb)

![image](https://github.com/user-attachments/assets/7dbea66f-c732-449d-8f64-d8fea75380de)

![image](https://github.com/user-attachments/assets/58c336a2-410d-498c-92f0-1bedd780c942)

![image](https://github.com/user-attachments/assets/9012279b-84ca-477b-944f-113e61383c10)

![image](https://github.com/user-attachments/assets/6b5ce30d-bbc4-4998-948d-23607cbb110a)

#### 3. Gestion des Dépôts
Taper la commande `nano /etc/apt/sources.list`.

La ligne `deb cdrom ....` permet de chercher un paquet dans le lecteur CDROM, je recommande de commenter la ligne en mettant un `#` au début de la ligne.

Remise en page du fichier pour une meilleur clareté.

![image](https://github.com/user-attachments/assets/c05dd301-8d3c-46ab-a5a9-ee1a7c95619f)

### C. Redirection de port (Virtualbox)
La redirection de port permet à la machine physique d'accéder à la VM.

![image](https://github.com/user-attachments/assets/016addcc-9a19-4721-99a3-16eddcded46c)

### D. Se connecter en SSH
Le protocole SSH est l'équivalent du Bureau à distance de Windows mais pour la console Linux. (Compte root est bloqué par défaut)
![image](https://github.com/user-attachments/assets/2f267ff8-941e-497c-953f-1828bd425c20)

### E. Se connecter en Root
![image](https://github.com/user-attachments/assets/b2e71036-f550-4689-8fb7-7d711364209c)

### F. Fuseau Horaire
Le fuseau horaire est important à configurer pour que l'heure dans les tickets soit réellement la bonne.

Exemple:
Si le serveur est à 11h et que l'heure réel est 12h et qu'on ouvre le ticket, celui-ci sera sur l'heure du serveur, soit 1 heurede décalage.

On vérifie le fuseau horaire (timedatectl) et si besoin on reconfigure le fuseau horaire. (dpk-reconfigure tzdata)

![image](https://github.com/user-attachments/assets/b3aae45b-e69d-46b1-898f-cf6dc6e119c3)

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Installation de LAMP
### A. Apache
```bash
apt install -y apache2 libapache2-mod-php;
```

### B. PHP
```bash
apt install -y php libapache2-mod-php;
```

### C. MariaDB
#### 1. Installation
```bash
apt install -y mariadb-server;
```
#### 2. Sécurisation (Recommandé)
Par défaut le compte root de la Base de donnée au niveau du mot de passe à est vide, il faut pour celà en définit .
```bsh
mysql_secure_installation;
```


<br />
