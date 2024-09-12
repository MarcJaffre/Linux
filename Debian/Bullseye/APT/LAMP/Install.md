------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation du serveur LAMP </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Installation
#### A. Apache
```bash
clear;
apt install -y apache2;
```

<br />

#### B. MariaDB
##### 1. Installation du paquet
```bash
clear;
apt install -y default-mysql-server;
```
##### 2. Sécuriser MariaDB
```bash
ROOT_DB_PASS=admin
(echo ""; echo "y"; echo "y"; echo "$ROOT_DB_PASS"; echo "$ROOT_DB_PASS"; echo "y"; echo "y"; echo "y"; echo "y") | mysql_secure_installation | 1>/dev/null;
```
##### 3. Autoriser l'authentification passive
```bash
clear;
mysql -u root -p${ROOT_DB_PASS} -e "ALTER USER root@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('admin');"
```
##### 4. Vérification de la connexion SQL
```bash
clear;
mysql -u root -p${ROOT_DB_PASS} -e "SHOW DATABASES;"
```

<br />

#### C. PHP
##### 1. Installation de PHP
```bash
clear;
apt install -y php;
```

##### 2. Module Apache
Ce paquet fournit le module PHP pour le serveur web Apache 2.
```bash
clear;
apt install -y libapache2-mod-php;
```

##### 3. Relance Apache
Le service Apache lance PHP et PHP charge les modules PHP-*.
```bash
clear;
systemctl restart apache2;
```
