----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation de l'outil de supervision LibreNMS </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Déploiement de LibreNMS
#### A. Installation de paquet
##### 1. Dépendances
```bash
clear;
apt update 1>/dev/null;
apt install -y acl apt-transport-https ca-certificates curl fping git graphviz imagemagick lsb-release mariadb-client mariadb-server mtr-tiny nginx-full nmap
apt install -y python3-dotenv python3-pymysql python3-redis python3-setuptools python3-systemd python3-pip rrdtool snmp snmpd unzip whois wget;
```

##### 2. Dépôt PHP8
```bash
clear;
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg;
echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list;
apt update;
```
##### 3. Installation de PHP
```bash
clear;
apt install -y php8.2-{cli,curl,fpm,gd,gmp,mbstring,mysql,snmp,xml,zip};
```

#### B. Création d'un compte utilisateur de service
useradd librenms -d /opt/librenms -M -r -s "$(which bash)";

#### C. Téléchargement de LibreNMS
cd /opt;
git clone https://github.com/librenms/librenms.git;

#### D. Modification des permissions
chown -R librenms:librenms /opt/librenms;
chmod 771 /opt/librenms;
setfacl -d -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/;
setfacl -R -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/;

#### E. Installation des composants
runuser -l librenms -c './scripts/composer_wrapper.php install --no-dev';

#### F. Définir le fuseau horaire sur Paris
timedatectl set-timezone Europe/Paris;
sed -i -e "s/^\;date.timezone \=/date.timezone \= Europe\/Paris/g" /etc/php/8.2/fpm/php.ini;
sed -i -e "s/^\;date.timezone \=/date.timezone \= Europe\/Paris/g" /etc/php/8.2/cli/php.ini

#### G. Relance du service PHP
systemctl restart php8.2-fpm.service;

#### H. MariaDB
##### 1. Installation du paquet
PASS_ROOT_SQL=admin
apt install -y mariadb-server 1>/dev/null;
(echo ""; echo "y"; echo "y"; echo "$PASS_ROOT_SQL"; echo "$PASS_ROOT_SQL"; echo "y"; echo "y"; echo "y"; echo "y") | mysql_secure_installation | 1>/dev/null;
systemctl enable --now mariadb;

#### 2. Suppression de la base de donnée librenms
mysql -u root -padmin -e "DROP DATABASE IF EXISTS librenms

#### 2. Suppression de l'utilisateur librenms
mysql -u root -padmin -e "DROP USER IF EXISTS 'librenms'@'localhost';"

#### 3. Création de la base de donnée librenms
mysql -u root -padmin -e "CREATE DATABASE IF NOT EXISTS librenms CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

#### 4. Création de l'utilisateur librenms
mysql -u root -padmin -e "CREATE USER IF NOT EXISTS 'librenms'@'localhost' IDENTIFIED BY 'PASSSWORD123';"

#### 5. Modification des permissions
mysql -u root -padmin -e "GRANT ALL PRIVILEGES ON librenms.* TO 'librenms'@'localhost';"
mysql -u root -padmin -e "ALTER USER librenms@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('PASSSWORD123');"

#### 6. Vérification de la base de donnée
mysql -u root -padmin -e "SELECT User FROM mysql.user; SHOW DATABASES;"
mysql -u librenms -pPASSWORD123 -e "SHOW DATABASES;"

#### 7. Configuration de MariaDB
Ajouter le contenu après `[mysqld]`.

nano /etc/mysql/mariadb.conf.d/50-server.cnf;
innodb_file_per_table   = 1
lower_case_table_names  = 0

#### 8. Activation de MariaDB
systemctl restart mariadb;
systemctl enable  mariadb;
systemctl status  mariadb;



