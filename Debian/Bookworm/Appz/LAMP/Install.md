--------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation de Linux Apache MariaDB PHP</p>
--------------------------------------------------------------------------------------------------------------------------------
## I. Installation
### A. Apache
```bash
clear;
apt install -y apache2 1>/dev/null;
```

### B. MariaDB
```bash
clear;
PASS_ROOT_SQL=admin
apt install -y mariadb-server 1>/dev/null;
(echo ""; echo "y"; echo "y"; echo "$PASS_ROOT_SQL"; echo "$PASS_ROOT_SQL"; echo "y"; echo "y"; echo "y"; echo "y") | mysql_secure_installation | 1>/dev/null;
```

### C. PHP
#### 1. Base
```bash
clear;
apt install -y php libapache2-mod-php 1>/dev/null;
```
#### 2. Fuseau Horaire
```bash
clear;
PHP_VERSION=$(php -version | head -n 1 | cut -d "P" -f3 | cut -c 2-4)
sed -i -e "s/;date.timezone \=/date.timezone \= Europe\/Paris/g" /etc/php/$PHP_VERSION/apache2/php.ini;
grep "date.timezone" /etc/php/$PHP_VERSION/apache2/php.ini;
systemctl restart apache2;
```

<br />

--------------------------------------------------------------------------------------------------------------------------------
## II. UTilisation
### A. MariaDB
```sql
clear;

# Suppression de la BDD et USER
mysql -u root -padmin -e "DROP DATABASE IF EXISTS SITE;"
mysql -u root -padmin -e "DROP USER IF EXISTS 'USER'@'localhost';"

# Création de la BDD
mysql -u root -padmin -e "CREATE DATABASE IF NOT EXISTS SITE;"

# Création de l'utilisateur
mysql -u root -padmin -e "CREATE USER  IF NOT EXISTS 'USER'@'localhost' IDENTIFIED BY 'mypassword';"

# Permission de la BDD pour le compte
mysql -u root -padmin -e "GRANT ALL PRIVILEGES ON SITE.* TO 'USER'@'localhost';"

# Permettre l'authentification pour GLPI
mysql -u root -padmin -e "ALTER USER USER@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('mypassword');"


# Verification
mysql -u root -padmin      -e "SELECT User FROM mysql.user; SHOW DATABASES;"
mysql -u USER -pmypassword -e "SHOW DATABASES;"
```
