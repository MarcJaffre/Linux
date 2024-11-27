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

Puis il est nécessaire de redémarrer le service `networking` pour que la configuration s'applique.

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

![image](https://github.com/user-attachments/assets/9012279b-84ca-477b-944f-113e61383c10)



