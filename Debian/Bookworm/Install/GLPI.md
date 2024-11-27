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
