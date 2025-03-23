----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation de l'outil de supervision LibreNMS </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
LibreNMS est un outil de supervision.

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
```bash
clear;
useradd librenms -d /opt/librenms -M -r -s "$(which bash)";
```

#### C. Téléchargement de LibreNMS
```bash
clear;
cd /opt;
git clone https://github.com/librenms/librenms.git;
```

#### D. Modification des permissions
```bash
clear;
chown -R librenms:librenms /opt/librenms;
chmod 771 /opt/librenms;
setfacl -d -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/;
setfacl -R -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/;
```

#### E. Installation des composants
```bash
clear;
runuser -l librenms -c './scripts/composer_wrapper.php install --no-dev';
```

#### F. Définir le fuseau horaire sur Paris
```bash
clear;
timedatectl set-timezone Europe/Paris;
sed -i -e "s/^\;date.timezone \=/date.timezone \= Europe\/Paris/g" /etc/php/8.2/fpm/php.ini;
sed -i -e "s/^\;date.timezone \=/date.timezone \= Europe\/Paris/g" /etc/php/8.2/cli/php.ini
```

#### G. Relance du service PHP
```bash
clear;
systemctl restart php8.2-fpm.service;
```

#### H. MariaDB
##### 1. Installation du paquet
```bash
clear;
PASS_ROOT_SQL=admin
apt install -y mariadb-server 1>/dev/null;
(echo ""; echo "y"; echo "y"; echo "$PASS_ROOT_SQL"; echo "$PASS_ROOT_SQL"; echo "y"; echo "y"; echo "y"; echo "y") | mysql_secure_installation | 1>/dev/null;
```

##### 2. Suppression de la base de donnée librenms
```bash
clear;
mysql -u root -padmin -e "DROP DATABASE IF EXISTS librenms
```

##### 2. Suppression de l'utilisateur librenms
```bash
clear;
mysql -u root -padmin -e "DROP USER IF EXISTS 'librenms'@'localhost';"
```

##### 3. Création de la base de donnée librenms
```bash
clear;
mysql -u root -padmin -e "CREATE DATABASE IF NOT EXISTS librenms CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
```

##### 4. Création de l'utilisateur librenms
```bash
clear;
mysql -u root -padmin -e "CREATE USER IF NOT EXISTS 'librenms'@'localhost' IDENTIFIED BY 'PASSSWORD123';"
```

##### 5. Modification des permissions
```bash
clear;
mysql -u root -padmin -e "GRANT ALL PRIVILEGES ON librenms.* TO 'librenms'@'localhost';"
mysql -u root -padmin -e "ALTER USER librenms@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('PASSSWORD123');"
```

#### 6. Vérification de la base de donnée
```bash
clear;
mysql -u root -padmin -e "SELECT User FROM mysql.user; SHOW DATABASES;"
mysql -u librenms -pPASSWORD123 -e "SHOW DATABASES;"
```

##### 7. Configuration de MariaDB
Ajouter le contenu après `[mysqld]`.
```bash
clear;
nano /etc/mysql/mariadb.conf.d/50-server.cnf;
```
```
innodb_file_per_table   = 1
lower_case_table_names  = 0
```


##### 8. Activation de MariaDB
```bash
clear;
systemctl restart mariadb;
systemctl enable  mariadb;
systemctl status  mariadb;
```

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Configuration de PHP
##### A. Copie de fichier
```bash
clear;
cp /etc/php/8.2/fpm/pool.d/www.conf /etc/php/8.2/fpm/pool.d/librenms.conf;
```

##### B. Configuration du fichier librenms pour PHP
```bash
clear;
sed -i -e "s/\[www\]/[librenms]/g"                                                           /etc/php/8.2/fpm/pool.d/librenms.conf;
sed -i -e "s/user \= www-data/user \= librenms/g"                                            /etc/php/8.2/fpm/pool.d/librenms.conf;
sed -i -e "s/^group \= www-data/group \= librenms/g"                                         /etc/php/8.2/fpm/pool.d/librenms.conf;
sed -i -e "s/listen \= \/run\/php\/php8.2-fpm.sock/listen \= \/run\/php-fpm-librenms.sock/g" /etc/php/8.2/fpm/pool.d/librenms.conf;
grep -v "^;"  /etc/php/8.2/fpm/pool.d/librenms.conf;
```


##### C. Configuration de Nginx
###### 1. Création d'un VirtualHost
Modifier la valeur `192.168.180.28` par l'adresse utilisable (IP ou DNS)
```bash
clear;
nano /etc/nginx/sites-enabled/librenms.vhost;
```

```bash
server {
 listen       80;
 server_name  192.168.180.28 _;
 root         /opt/librenms/html;
 index        index.php;
 charset      utf-8;
 gzip         on;
 gzip_types   text/css application/javascript text/javascript application/x-javascript image/svg+xml text/plain text/xsd text/xsl text/xml image/x-icon;
 location / { try_files $uri $uri/ /index.php?$query_string; }
 location ~ [^/]\.php(/|$) { fastcgi_pass unix:/run/php-fpm-librenms.sock; fastcgi_split_path_info ^(.+\.php)(/.+)$; include fastcgi.conf; }
 location ~ /\.(?!well-known).* { deny all; }
}
```

###### 2. Validation de la configuration
```bash
clear;
nginx -t;
```

###### 3. Déplacer la configuration par défaut Nginx
```bash
clear;
mv /etc/nginx/sites-enabled/default /etc/nginx/;
```

##### X. Relance des services
```bash
clear;
systemctl restart php8.2-fpm.service;
systemctl reload nginx;
systemctl restart php8.2-fpm;
```

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### IV. LNMS et SNMP
#### A. Activation du binaire LNMS avec ses dépendances
```bash
clear;
ln -s /opt/librenms/lnms /usr/bin/lnms;
cp /opt/librenms/misc/lnms-completion.bash /etc/bash_completion.d;
```
#### B. SNMP Daemon
##### 1. Copie de fichier
```bash
clear;
cp /opt/librenms/snmpd.conf.example /etc/snmp/snmpd.conf;
```
##### 2. Définir la communauté SNMP
```bash
clear;
sed -i -e "s/RANDOMSTRINGGOESHERE/librenms/g" /etc/snmp/snmpd.conf;
```
##### 3. Déployé l'agent LibreNMS
```bash
clear;
curl -o /usr/bin/distro https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/distro;
chmod +x /usr/bin/distro;
```
##### 4. Activation du service SNMP Daemon
```bash
clear;
systemctl enable snmpd;
systemctl restart snmpd;
```
#### C. Planification de tâche
```bash
clear;
cp /opt/librenms/dist/librenms.cron /etc/cron.d/librenms;
cp /opt/librenms/misc/librenms.logrotate /etc/logrotate.d/librenms;
```

#### D. Activation du service LibreNMS Scheduler
```bash
clear;
cp /opt/librenms/dist/librenms-scheduler.service /opt/librenms/dist/librenms-scheduler.timer /etc/systemd/system/
systemctl enable --now librenms-scheduler.timer;
```

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### V. WebUI
#### A. Installation du site
##### 1. WebUI
```
http://192.168.180.28
```
#### 2. Information de la base de donnée
```
Host   : localhost
Port   : 3306
User   : librenms
Pass   : PASSSWORD123
DBName : librenms
```

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### VI. Validator LibreNMS
#### A. A quoi sert Validator ?
Validator permet de confirmer la bonne installation du site

#### B. Accéder à Validator
Aller sur la roue en haut à droite puis sur Validator.

#### C. Cliquer sur le bouton vert pour valider le correctif SQL pour le TimeZone

#### D. FAIL: base_url is not set correctly
Si l'IP du serveur est derrière un pare-feu, ce qui est mon cas, taper la commande suivante. (IP de pfsense côté WAN)
```
runuser -l librenms -c "lnms config:set base_url http://192.168.180.28:8083/"
```

#### E. Consider adding a device such as localhost
Ajouter un hôte. L'adresse de mon serveur est 192.168.200.13.
```
Hostname or IP        : 192.168.200.13
SNMP Version          : v2c 
Port SNMP             : 161
Type de port          : udp
Port Association Mode : IfIndex
Community Name        : librenms
```

#### F. Validator en Ligne de commande
```bash
clear;
runuser -l librenms -c './validate.php'
```
