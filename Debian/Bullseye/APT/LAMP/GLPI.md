--------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Guide de Déploiement de GLPI sous Debian </p>

--------------------------------------------------------------------------------------------------------------------------------------------
#### I. Base De Donnée
##### A. Gestion de la Base De Donnée
```bash
clear;

# Suppression de la BDD et USER
mysql -u root -padmin -e "DROP DATABASE IF EXISTS GLPI;DROP USER IF EXISTS 'GLPI'@'localhost';"

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

<br />

--------------------------------------------------------------------------------------------------------------------------------------------
### II. Préparation Environnement
##### A. Télécharger GLPI
```bash
clear;
VERSION=10.0.10
wget https://github.com/glpi-project/glpi/releases/download/$VERSION/glpi-$VERSION.tgz -O /tmp/glpi.tgz 2>/dev/null;
```
##### B. Extraire GLPI
```bash
clear;
tar -xf /tmp/glpi.tgz -C /var/www/html;
```
##### C. Permission
ajout de chmod a voir
```bash
clear;
chown -R www-data:www-data /var/www/html;
chmod 755 /var/www/html/glpi;
```
##### D. Modules PHP
```bash
clear;

# Indispensable:
apt install -y php-curl php-gd php-intl php-mysqli php-simplexml 1>/dev/null;

# Optionnel:
apt install -y php-bz2 php-ldap php-mbstring php-symfony-polyfill-ctype php-zip 1>/dev/null;
```
##### E. Relance du service Apache
```bash
clear;
systemctl restart apache2;
```
##### F. Vérification (Prérequis, Sécurité)
```bash
clear;
/var/www/html/glpi/bin/console glpi:system:check_requirements;
```


<br />


--------------------------------------------------------------------------------------------------------------------------------------------
#### III. Installation du site
##### A. Installation du site
```bash
clear;

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

##### B. Réponse des questions
La première question est la confirmation de l'installation.

La seconde question l'envoi des statistiques du site GLPI vers la "société GLPI".

![image](https://github.com/dexter74/Linux/assets/35907/e6b16ec2-1626-437a-95a1-af231ac42a7d)

##### C. Supprimer le fichier Install.php
Le fichier install.php doit être renommé ou Supprimé
```bash
clear;
rm /var/www/html/glpi/install/install.php;
```
##### D. Editer l'URL de GLPI (Facultatif)
Par défaut l'URL est sur http://localhost, il faut modifier l'URL. La commande suivante modifie la valeur d'une table.

Le serveur à comme adresse 192.168.0.10
```sql
clear;
NET_INTERFACE=$(ip add | grep "2:" | cut -d ":" -f 2 |cut -c 2-10)
NET_IP=$(ip address show ${NET_INTERFACE} | grep "$NET_INTERFACE" |tail -n 1 | cut -d "/" -f 1 |cut -c 10-50)
mysql -u GLPI -padmin -e "USE GLPI; UPDATE glpi_configs SET value = 'http://$NET_IP/glpi' WHERE glpi_configs.id = 38;"
```

<br />
<br />

--------------------------------------------------------------------------------------------------------------------------------------------
#### IV. Configuration du site Apache (OPTIONNEL)
La configuration suivante définira l'URL Racine du site sur GLPI.

Il change le répertoire par défaut `/var/www/html` en `/var/www/html/glpi/public` via le paramètre `DocumentRoot`.

Par conséquent, l'URL de base du site (http://X.X.X.X/) est GLPI.

##### B. Activer le Module Rewrite (Opérationnel)
```bash
clear;
/usr/sbin/a2enmod rewrite;
```

##### C. Configurer le Serveur Web ([DOC](https://glpi-install.readthedocs.io/fr/latest/prerequisites.html#webserver-configuration)) (Opérationnel)
Dans le but d'avoir plus d'erreur sur le Dashboard de GLPI, il faut configurer le site apache. (Chemin modifier par rapport à la doc)
```bash
clear;
mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf.old;
nano /etc/apache2/sites-enabled/000-default.conf;
systemctl restart apache2;
```

**000-default.conf**
```bash
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

**Retour en Arrière**
```bash
cat /etc/apache2/sites-enabled/000-default.conf.old  > /etc/apache2/sites-enabled/000-default.conf; systemctl restart apache2
```

<br />

--------------------------------------------------------------------------------------------------------------------------------------------
#### V. Guide d'utilisation
##### X. Mes préférences
```
Mon Pseudo > Mes préférences > Personnalisation
 > Mise en page	
  > Horizontal
```
##### X. Configurer le serveur
```
Configuration >  Générale
 [Configuration générale]
  > URL de l'application: http://glpi.local
 [API]
  > URL de l'API	: http://glpi.local/api
```
##### X. Définir les mots de passes des comptes par défaut
```
Administration > Utilisateurs > <Nom d'utilisateur>
 > Changer les mots de passe des comptes glpi, post-only, tech et normal.
 > Jeton : Identifiant Unique
```
##### X. Configurer l'inventaire Natif de GLPI
```
Administration > Inventaire
 > Activer l'inventaire: OUI
 > Créer un ordinateur pour les machines virtuelles	: OUI 
```
##### X. Mettre en service le MarketPlace
```
Configuration > plugins > Marketplace
 > [Nouvelle Onglet] S'enregistrer sur GLPI Network
 > Cliquer sur Connexion (En haut à droite)
 > Se connecter
 > Cliquer sur Enregistrement à Gauche
 > Copier la Clé
 
 [GLPI]
  > Renseignez votre clé d'enregistrement dans la configuration
  > Coller la clé
```



```
# Email: Drthrax..@gmail.com
eyJzdWJzY3JpcHRpb24iOjcxNjQzLCJyIjo0MjQxNzE3MTAzNjM2Nzk0ODQwLCJzaWduYXR1cmUiOiJBSUNSQ2RhWk9PTHZVckFmZTVLTHR6NjVXM2QwVVZLNjhWVmllZ3A2elR4ekFaNDZ0cThTTCtqaFwvd0NIT2pyOERxaXdTUm9JRE1za0R1cmZrZGpnaVl3aE84WFRuTU11aldJZmljcEdRSmVRWHlnOHgxXC9IN2R6YVwvQmdrR1dVR1hvdytlVktsSyszM21ZcWtnOXJjcEpwYzZoNXBOemttekVJVWR4a1QreFBBeExQZnQ4UG43VW5qTlloSFNmZTUyMkhjQjdZOFhtd3h2N0NFOGpMM01HQVZMMEZ4ZWFuSjEzOTBYaEI3VjZDYjRKNmduZ0tIZFpyMDNsXC93M1NXRVU2bHU5eXZVZGROaVhoM2hUNmlub2RSeDltWXFjYVRHdHduMUF5U244OW8zRFU4UlJxOVwvNXBsdUNVejdlZTBSY1QxXC9KZVZSU3ZOUzlYUU5wdz09In0=
```

##### X. Installer des plugins
```
Administration > plugins > marketplace
 > XXXXX
  > 1er fois  : Téléchargement
  > 2nd fois  : Installer
  > 3ème fois : Activer
```
##### X. Configurer le Plugin GLPI Inventory (Expérimental)
```
Administration > plugins > marketplace
 > GLPI Inventory
  [Bandeau Vertical]
  > Configuration générale
   > SSL seulement pour l'agent: Oui (Défaut: NON)
  > Modules des agents
   > WakeOnLan                           : ON
   > Inventaire ordinateur               : ON
   > Inventaire distant des hôtes VMware : ON
   > Inventaire réseau (SNMP)            : ON
   > Découverte réseau                   : ON
   
  [Bandeau Horizontal]
  > Déployer
   > Gestions des paquets
```
<br />

--------------------------------------------------------------------------------------------------------------------------------------------
#### VI. AGENT INVENTORY (Client)
##### Télécharger le plugin Agent Inventory
```bash
# Télécharger l'agent Inventory
https://github.com/glpi-project/glpi-agent/releases

#  URL pour l'Agent si on utilise l'Agent GLPI en Natif:
http://192.168.0.50/glpi/front/inventory.php

# URL pour l'Agent si on utilise un plugin:
http://192.168.0.50/glpi/marketplace/glpiinventory

# Client Leger: Editer agent.cfg
# server = http://192.168.0.50/glpi/front/inventory.php
# Check :  http://192.168.0.50/glpi/front/agent.php
# Lancer le fichier glpi-agent.bat en administrateur pour inventorier

# Linux : /etc/glpi-agent/agent.cfg
# server = 192.168.0.50
```
##### Inventorier le PC
```bash
http://127.0.0.1:62354/
```
#### Log
```bash
C:\Program Files\GLPI-Agent\logs\glpi-agent.log
/var/www/html/glpi/files/_log
```
#### Utilitaire GUI
```bash
https://github.com/glpi-project/glpi-agentmonitor/
```

![image](https://github.com/dexter74/Linux/assets/35907/6584ca84-c8b3-4496-aa2e-c99163bebc28)

<br />
<br />

--------------------------------------------------------------------------------------------------------------------------------------------
#### X. URL Personnaliser (glpi.local)
Pour permettre d'avoir une URL customisé, il faut que le serveur DNS est une entrée qui point vers la machines, et la machine qui demande la requête doit avoir la réponse.
###### Vérification Résolution DNS
```
# La machine 192.168.0.5 dispose des services
# Le service ADGuardHome est un service DNS (Création de redirection *.local vers Machine local)
# Le service Nginx Proxy Manager est un reverse proxy (glpi.local vers IP de la machine)

C:\Users\marc>nslookup glpi.local
 > Serveur : LXC.Docker.lan
 > Address : 192.168.0.5

Réponse ne faisant pas autorité :
Nom        : glpi.local
Address    : 192.168.0.5
```
###### Création de la configuration du site glpi.local
```bash
nano /etc/apache2/sites-available/glpi.local.conf;
```

```
<VirtualHost *:80>
  # Email Admin
  ServerAdmin teste74@hotmail.fr

  # Nom de la machine
  ServerName debian.lan

  # URL du site
  ServerAlias glpi.local

  # Racine du Site
  DocumentRoot /var/www/html/glpi/public

  # Chargement page dans ordre
  <IfModule dir_module>
   DirectoryIndex index.php index.html
  </IfModule>

  # Log
  ErrorLog /error.log
  CustomLog /access.log combined

  # Alias "/glpi" "/var/www/html/glpi/public"
  <Directory /var/www/html/glpi/public>
   Require all granted
   RewriteEngine On
   RewriteCond %{REQUEST_FILENAME} !-f
   RewriteRule ^(.*)$ index.php [QSA,L]
  </Directory>

</VirtualHost>
```
###### Activation du site
```bash
clear;
/usr/sbin/a2ensite glpi.local.conf;
```
###### Relance du site
```bash
clear;
systemctl restart apache2;
```
<br />
