--------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Guide de Déploiement de GLPI sous Debian </p>

--------------------------------------------------------------------------------------------------------------------------------------------
### Préparation de l'environnement
Il faut appliquer la fiche LAMP avant d'installer GLPI.


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
VERSION=10.0.9
wget https://github.com/glpi-project/glpi/releases/download/$VERSION/glpi-$VERSION.tgz -O /tmp/glpi.tgz 2>/dev/null;
```
##### B. Extraire GLPI
```bash
clear;
tar -xf /tmp/glpi.tgz -C /var/www/html;
```
##### C. Permission
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
