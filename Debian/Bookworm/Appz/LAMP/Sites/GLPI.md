--------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Guide de Déploiement de GLPI sous Debian </p>
--------------------------------------------------------------------------------------------------------------------------------------------
## I. Base De Donnée
### A. Gestion de la Base De Donnée
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
## II. Apache
### A. Configuration
```bash
clear;
mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf.old;
nano /etc/apache2/sites-enabled/000-default.conf;
```

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

<br />

--------------------------------------------------------------------------------------------------------------------------------------------
## III. PHP
### A. Activation du module Rewrite (Apache2)
```bash
clear;
/usr/sbin/a2enmod rewrite;
```

### B. Correctif
#### 1. session.cookie_httponly
```bash
clear;
PHP_VERSION=$(php -version | head -n 1 | cut -d "P" -f3 | cut -c 2-4)
sed -i -e 's/^session.cookie_httponly =/session.cookie_httponly = on/g' /etc/php/$PHP_VERSION/apache2/php.ini;
```
#### 2. Relance Apache2
```bash
clear;
systemctl restart apache2;
```

<br />

--------------------------------------------------------------------------------------------------------------------------------------------
## IV. GLPI (Partie I)
### A. Télécharger GLPI
```bash
clear;
VERSION=10.0.9
wget https://github.com/glpi-project/glpi/releases/download/$VERSION/glpi-$VERSION.tgz -O /tmp/glpi.tgz 2>/dev/null;
```
### B. Extraire GLPI
```bash
clear;
tar -xf /tmp/glpi.tgz -C /var/www/html;
```
### D. Log
```bash
clear;
mkdir -p /var/www/glpi/files/_log
```

### C. Permission
```bash
clear;
chown -R www-data:www-data /var/www/html;
chmod 755 /var/www/html/glpi;
```


### D. Modules PHP
#### 1. Indispensable
```bash
clear;
apt install -y php-curl php-gd php-intl php-mysqli php-simplexml 1>/dev/null;
```
#### 2. Optionnel
```bash
apt install -y php-bz2 php-ldap php-mbstring php-symfony-polyfill-ctype php-zip 1>/dev/null;
```

#### E. Relance du service Apache
```bash
clear;
systemctl restart apache2;
```

<br />

--------------------------------------------------------------------------------------------------------------------------------------------
## III. GLPI (Partie II)
### A. Vérification (Prérequis, Sécurité)
```bash
clear;
/var/www/html/glpi/bin/console glpi:system:check_requirements;
```

### B. Installation du site
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

### C. Install.php
Le fichier install.php doit être renommé ou Supprimé.
```bash
clear;
rm /var/www/html/glpi/install/install.php;
```
