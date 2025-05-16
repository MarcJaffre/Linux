------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de MariaDB et création de la base de donnée </p>
------------------------------------------------------------------------------------------------------------
## I. Installation de la base de donnée
### A. Installation du paquet
```
apt install mariadb-server
```
### B. Afficher la version de MariaDB
```
mariadb --version
```
### C. Sécurisation de la Base De Donnée
```
mysql_secure_installation
```

<br />

------------------------------------------------------------------------------------------------------------
## II. Création de la Base de donnée et son utilisateur
### A. Suppression de la BDD et USER
```
/usr/bin/mariadb -u root -p -e "DROP DATABASE IF EXISTS wiki;DROP USER IF EXISTS 'wikijs'@'localhost';"
```

### C. Création de la BDD
```
/usr/bin/mariadb -u root -p -e "CREATE DATABASE IF NOT EXISTS wiki;"
```
### D. Création de l'utilisateur
```
/usr/bin/mariadb -u root -p -e "CREATE USER  IF NOT EXISTS 'wikijs'@'localhost' IDENTIFIED BY 'wikijsrocks';"
```
### E. Permission de la BDD pour le compte
```
/usr/bin/mariadb -u root -p -e "GRANT ALL PRIVILEGES ON wiki.* TO 'wikijs'@'localhost';"
```
### F. Permettre l'authentification pour Wiki
```
/usr/bin/mariadb -u root -p -e "ALTER USER wikijs@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('wikijsrocks');"
```

### G. Afficher les Users 
```
/usr/bin/mariadb -u root -padmin -e "SELECT User FROM mysql.user; SHOW DATABASES;"
```

### H. Liste des SQL gérer par le compte USER:
```
/usr/bin/mariadb -u wikijs -pwikijsrocks -e "SHOW DATABASES;"
```
