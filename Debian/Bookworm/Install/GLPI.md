----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> .:( Installation de GLPI sous Debian ):. </p>

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

On vérifie le fuseau horaire (timedatectl) et si besoin on reconfigure le fuseau horaire. (dpkg-reconfigure tzdata)

![image](https://github.com/user-attachments/assets/b3aae45b-e69d-46b1-898f-cf6dc6e119c3)

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Installation de LAMP + GLPI 
### A. Apache
#### 1. Installation
```bash
apt install -y apache2 libapache2-mod-php;
```

#### 2. Fix GLPI
```
# Activation du module Rewrite (Apache2)
/usr/sbin/a2enmod rewrite;

# Renommer le fichier du site web d'Apache (000-default.conf => 000-default.conf.old)
mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf.old;

# Création d'un fichier
nano /etc/apache2/sites-enabled/000-default.conf;

# COPIER LE CODE (Voir ci-dessous) #

# Relance du service
systemctl restart apache2;
```

**000-default.conf**
```
<VirtualHost *:80>
 # Nom du serveur (/etc/hosts)
 ServerName debian.lan

 # Dossier Web Public
 DocumentRoot /var/www/html/glpi/public
        
 # Fichier à charger par défaut (ordre)
 <IfModule dir_module>
   DirectoryIndex index.php index.html
 </IfModule>

 # Alias
 Alias "/glpi" "/var/www/html/glpi/public"

 # Log
 ErrorLog ${APACHE_LOG_DIR}/error.log
 CustomLog ${APACHE_LOG_DIR}/access.log combined

 # Repertoire
 <Directory /var/www/html/glpi/public>
   Require all granted
   RewriteEngine On
   RewriteCond %{REQUEST_FILENAME} !-f
   RewriteRule ^(.*)$ index.php [QSA,L]
 </Directory>
</VirtualHost>
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

![image](https://github.com/user-attachments/assets/6f023d62-1724-429a-aa02-2cbb8bca15f1)

![image](https://github.com/user-attachments/assets/8bfb35eb-47dc-4c0d-89cc-c126605153f9)

![image](https://github.com/user-attachments/assets/40d233f8-414e-4681-b2ee-19f02f8cad42)

![image](https://github.com/user-attachments/assets/e3ca7a05-7acf-47fa-8bbf-c07b0662c643)

![image](https://github.com/user-attachments/assets/9ad8d0f1-d7cb-44d7-ad33-1ad029447c46)

![image](https://github.com/user-attachments/assets/4f91e560-afb6-4cac-8501-5772f941aa69)

![image](https://github.com/user-attachments/assets/9fdb1e4a-5c3b-443a-bd7a-28be20d7de72)

#### 3. Base De Donnée
Le mot de passe root de ma base de donnée est `admin`. Le mot de passe doit être coller au paramètre `-p`.
```
# Suppression de la BDD et USER
mysql -u root -padmin -e "DROP DATABASE IF EXISTS GLPI"
mysql -u root -padmin -e "DROP USER IF EXISTS 'GLPI'@'localhost';"

# Création de la BDD
mysql -u root -padmin -e "CREATE DATABASE IF NOT EXISTS GLPI;"

# Création de l'utilisateur
mysql -u root -padmin -e "CREATE USER 'GLPI'@'localhost' IDENTIFIED BY 'admin';"

# Permission de la BDD pour le compte
mysql -u root -padmin -e "GRANT ALL PRIVILEGES ON GLPI.* TO 'GLPI'@'localhost';"

# Fuseau Horaire
mysql -u root -padmin -e "GRANT SELECT ON mysql.time_zone_name TO 'GLPI'@'localhost';"

# Permettre l'authentification pour GLPI
mysql -u root -padmin -e "ALTER USER GLPI@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('admin');"
```

#### 4. GLPI
La variable VERSION permet de définir la version qu'on souhaite télécharger de GLPI.

L'utilisateur www-data est le compte utilisateur du processus d'APACHE et donc le dossier www doit appartenir à www-data.
```bash
# Telecharger GLPI 10.0.9
VERSION=10.0.9
wget https://github.com/glpi-project/glpi/releases/download/$VERSION/glpi-$VERSION.tgz -O /tmp/glpi.tgz;

# Extraire le fichier compresser
tar -xf /tmp/glpi.tgz -C /var/www/html;

# Permissions (Apache)
chown -R www-data:www-data /var/www/html;
chmod 755 /var/www/html/glpi;

# Extensions Indispensables pour GLPI
apt install -y php-curl php-gd php-intl php-mysqli php-simplexml;

# Extensions Optionnelles pour GLPI
apt install -y php-bz2 php-ldap php-mbstring php-symfony-polyfill-ctype php-zip;

# Relance du service
systemctl restart apache2;
```

L'installation suivante est réalisable sur l'interface web.
```
# Check Requirement
/var/www/html/glpi/bin/console glpi:system:check_requirements;

# Installation du site (Repondre Yes puis No)

LANGUE=fr_FR
HOST=localhost
DATABSE=GLPI
USERNAMEDB=GLPI
PASSDB=admin

/var/www/html/glpi/bin/console db:install \
--reconfigure \
--default-language=$LANGUE \
--db-host=$HOST \
--db-port=3306 \
--db-name=$DATABSE \
--db-user=$USERNAMEDB \
--db-password=$PASSDB \
--force;
```

Une fois l'installation finit, il faut supprimer le fichier install.php.
```
rm /var/www/html/glpi/install/install.php;
```

![image](https://github.com/user-attachments/assets/fb19c7cd-179e-4c0f-8403-dc76d351c1dd)

