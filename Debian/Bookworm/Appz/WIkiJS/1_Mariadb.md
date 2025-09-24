------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de MariaDB et création de la base de donnée </p>
------------------------------------------------------------------------------------------------------------
## I. Installation de la base de donnée
### A. Installation du paquet
```bash
clear;
apt install mariadb-server;
```

### B. Afficher la version de MariaDB
```bash
clear;
mariadb --version;
```

### C. Sécurisation de la Base De Donnée
```bash
clear;
mysql_secure_installation;
```

<br />

------------------------------------------------------------------------------------------------------------
## II. Création de la Base de donnée et son utilisateur
L'identifiant de la base de donnée `wikijs` est `wiki` et son mot de passe est `wikijsrocks`. 

### A. Suppression de la BDD et USER
```bash
clear;
/usr/bin/mariadb -u root -p -e "DROP DATABASE IF EXISTS wiki;DROP USER IF EXISTS 'wikijs'@'localhost';"
```

### B. Création de la BDD
```bash
clear;
/usr/bin/mariadb -u root -p -e "CREATE DATABASE IF NOT EXISTS wiki;"
```

### C. Création de l'utilisateur
```bash
clear;
/usr/bin/mariadb -u root -p -e "CREATE USER  IF NOT EXISTS 'wikijs'@'localhost' IDENTIFIED BY 'wikijsrocks';"
```

### D. Permission de la BDD pour le compte
```bash
clear;
/usr/bin/mariadb -u root -p -e "GRANT ALL PRIVILEGES ON wiki.* TO 'wikijs'@'localhost';"
```

### E. Permettre l'authentification pour Wiki
```bash
clear;
/usr/bin/mariadb -u root -p -e "ALTER USER wikijs@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('wikijsrocks');"
```

### F. Afficher les Users 
```bash
clear;
/usr/bin/mariadb -u root -p -e "SELECT User FROM mysql.user; SHOW DATABASES;"
```

### G. Liste des SQL gérer par le compte USER:
```bash
clear;
/usr/bin/mariadb -u wikijs -pwikijsrocks -e "SHOW DATABASES;"
```
