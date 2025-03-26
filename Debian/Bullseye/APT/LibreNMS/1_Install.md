------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de LibreNMS </p>
------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Préparation de l'environnement
### A. Configuration réseau
`BC:24:11:D0:7A:A4`.


#### 1. Networking (Loopback)
```bash
clear;
cat > /etc/network/interfaces << EOF
source /etc/network/interfaces.d/*
auto lo
iface lo inet loopback
EOF
```

#### 2. Networking (Ethernet)
```bash
clear;
INTER_NET=$(ip add | grep "2: " | cut -d: -f 2 | cut -c 2-9)

cat > /etc/network/interfaces.d/ethernet << EOF
auto $INTER_NET
allow-hotplug $INTER_NET
iface $INTER_NET inet static
 address 192.168.0.34/24
 gateway 192.168.0.1
EOF
```

#### 3. Resolv.conf
```bash
clear;
cat > /etc/resolv.conf << EOF
domain home.lan
search home.lan
nameserver 192.168.0.1
EOF
```
#### 4. Relance du service
```bash
clear;
systemctl restart networking;
```

### B. Configuration Dépôt
```bash
clear;
cat > /etc/apt/sources.list << EOF
deb     http://ftp.fr.debian.org/debian/           bullseye           main non-free
deb-src http://ftp.fr.debian.org/debian/           bullseye           main
deb     http://security.debian.org/debian-security bullseye-security  main contrib
deb-src http://security.debian.org/debian-security bullseye-security  main contrib
deb     http://ftp.fr.debian.org/debian/           bullseye-updates   main contrib
deb-src http://ftp.fr.debian.org/debian/           bullseye-updates   main contrib
EOF
```

### C. Mise à jour
```bash
clear;
apt update 1>/dev/null;
apt dist-upgrade -y;
```

### D. Nom de la machine
```bash
clear;

cat > /etc/hostname << EOF
LibreNMS
EOF

cat > /etc/hosts << EOF
127.0.0.1       localhost
127.0.1.1       LibreNMS.home.lan   LibreNMS
192.168.0.34    LibreNMS.home.lan   LibreNMS
EOF
```

### E. Fuseau Horaire
```bash
clear;
timedatectl set-timezone Europe/Paris;
```

### X. MotD
```bash
clear;
cat > /etc/motd << EOF
############
# Librenms #
############
EOF
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Déploiement de LibreNMS
### A. Paquetts
#### 1. Indispensables
```bash
clear;
apt install -y acl;
apt install -y apt-transport-https;
apt install -y ca-certificates;
apt install -y curl;
apt install -y fping;
apt install -y git;
apt install -y graphviz;
apt install -y imagemagick;
apt install -y lsb-release;
apt install -y mariadb-client;
apt install -y mariadb-server;
apt install -y mtr-tiny;
apt install -y nginx-full;
apt install -y nmap;
apt install -y python3-dotenv;
apt install -y python3-pymysql;
apt install -y python3-redis;
apt install -y python3-setuptools;
apt install -y python3-systemd;
apt install -y python3-pip;
apt install -y rrdtool;
apt install -y snmp;
apt install -y snmpd;
apt install -y unzip;
apt install -y whois;
apt install -y wget;
apt install -y jq;
```
#### 2. PHP 8.X
```bash
clear;
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg;
echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list;
apt update 1>/dev/null;
apt install -y php8.2-{cli,curl,fpm,gd,gmp,mbstring,mysql,snmp,xml,zip} 1>/dev/null;
php -v | head -n 1 | cut -c 1-7;
```

#### 3. Fuseau Horaire (PHP 8.X)
```bash
clear;
VERSION=$(php -v | head -n 1 | cut -c 5-7)
sed -i -e "s/^\;date.timezone \=/date.timezone \= Europe\/Paris/g" /etc/php/$VERSION/fpm/php.ini;
sed -i -e "s/^\;date.timezone \=/date.timezone \= Europe\/Paris/g" /etc/php/$VERSION/cli/php.ini;
```

### B. Création de l'utilisateur LibreNMS
```bash
clear;
useradd librenms -d /opt/librenms -M -r -s "$(which bash)";
```

### C. LibreNMS
#### 1. Téléchargement
```bash
clear;
rm -r /opt/librenms 2>/dev/null;
git clone https://github.com/librenms/librenms.git /opt/librenms;
```
#### 2. Permissions
```bash
clear;
chown -R librenms:librenms /opt/librenms;
chmod 771 /opt/librenms;
setfacl -d -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/;
setfacl -R -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/;
```

#### 3. Action User
```bash
clear;
runuser -l librenms -c './scripts/composer_wrapper.php install --no-dev';
```
#### 4. Relance du service
```bash
clear;
systemctl restart php8.2-fpm.service;
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Base de donnée
### A. Sécurisation de MYSQL
```bash
clear;
PASS_ROOT_SQL=admin
apt install -y mariadb-server 1>/dev/null;
(echo ""; echo "y"; echo "y"; echo "$PASS_ROOT_SQL"; echo "$PASS_ROOT_SQL"; echo "y"; echo "y"; echo "y"; echo "y") | mysql_secure_installation | 1>/dev/null;
systemctl enable --now mariadb;
```

### B. Suppression de la BDD et USER
```bash
clear;
mysql -u root -padmin -e "DROP DATABASE IF EXISTS librenms;DROP USER IF EXISTS 'librenms'@'localhost';"
```

### C. Création de la BDD
```bash
clear;
mysql -u root -padmin -e "CREATE DATABASE IF NOT EXISTS librenms CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
```

### D. Création de l'utilisateur
```bash
clear;
mysql -u root -padmin -e "CREATE USER IF NOT EXISTS 'librenms'@'localhost' IDENTIFIED BY 'admin';"
```

### E. Permission de la BDD pour le compte
```bash
clear;
mysql -u root -padmin -e "GRANT ALL PRIVILEGES ON librenms.* TO 'librenms'@'localhost';"
mysql -u root -padmin -e "ALTER USER librenms@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('admin');"
```

### F. Vérification
```bash
clear;
mysql -u root -padmin -e "SELECT User FROM mysql.user; SHOW DATABASES;"
mysql -u librenms -padmin -e "SHOW DATABASES;"
```
### G. Configuration
```bash
clear;
nano /etc/mysql/mariadb.conf.d/50-server.cnf;
systemctl restart mariadb;
```

```
[mysqld]
innodb_file_per_table   = 1
lower_case_table_names  = 0
```
# Activation du service
```bash
clear;
systemctl enable --now mariadb;
systemctl status       mariadb;
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------
## IV. Configuration de LibreNMS
### A. PHP
```bash
clear;
cp /etc/php/8.2/fpm/pool.d/www.conf /etc/php/8.2/fpm/pool.d/librenms.conf;
sed -i -e "s/\[www\]/[librenms]/g"                                                           /etc/php/8.2/fpm/pool.d/librenms.conf;
sed -i -e "s/user \= www-data/user \= librenms/g"                                            /etc/php/8.2/fpm/pool.d/librenms.conf;
sed -i -e "s/^group \= www-data/group \= librenms/g"                                         /etc/php/8.2/fpm/pool.d/librenms.conf;
sed -i -e "s/listen \= \/run\/php\/php8.2-fpm.sock/listen \= \/run\/php-fpm-librenms.sock/g" /etc/php/8.2/fpm/pool.d/librenms.conf;
grep -v "^;"  /etc/php/8.2/fpm/pool.d/librenms.conf;
systemctl restart php8.2-fpm.service;
```
### B. VirtualHost
```bash
clear;
cat > /etc/nginx/sites-enabled/librenms.vhost << EOF
server {
 listen      80;
 server_name  192.168.0.34 _;
 root        /opt/librenms/html;
 index       index.php;
 charset utf-8;
 gzip on;
 gzip_types text/css application/javascript text/javascript application/x-javascript image/svg+xml text/plain text/xsd text/xsl text/xml image/x-icon;
 location / { try_files \$uri \$uri/ /index.php?\$query_string; }
 location ~ [^/]\.php(/|$) {
  fastcgi_pass unix:/run/php-fpm-librenms.sock;
  fastcgi_split_path_info ^(.+\.php)(/.+)$;
  include fastcgi.conf;
 }
 location ~ /\.(?!well-known).* {
  deny all;
 }
}
EOF
```

### C. Activation du site
```bash
clear;
rm /etc/nginx/sites-enabled/default 2>/dev/null;
nginx -t;
systemctl reload nginx;
systemctl restart php8.2-fpm;
```

### D. Activation de LNMS
```bash
clear;
ln -s /opt/librenms/lnms /usr/bin/lnms;
cp /opt/librenms/misc/lnms-completion.bash /etc/bash_completion.d;
```
### E. SNMP
#### 1. Configuration (Renommage)
```bash
clear;
cp /opt/librenms/snmpd.conf.example /etc/snmp/snmpd.conf;
```
#### 2. Communauté
```bash
clear;
sed -i -e "s/RANDOMSTRINGGOESHERE/librenms/g" /etc/snmp/snmpd.conf;
```

#### 3. Agent LibreNMS
```bash
clear;
curl -o /usr/bin/distro https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/distro;
chmod +x /usr/bin/distro;
systemctl enable snmpd;
systemctl restart snmpd;
```
#### 4. Cron
```bash
clear;
cp /opt/librenms/dist/librenms.cron /etc/cron.d/librenms;
```
#### 5. Scheduler Timer
```bash
clear;
cp /opt/librenms/dist/librenms-scheduler.service /opt/librenms/dist/librenms-scheduler.timer /etc/systemd/system/
systemctl enable --now librenms-scheduler.timer;
```

#### 6. LogRotate
```bash
clear;
cp /opt/librenms/misc/librenms.logrotate /etc/logrotate.d/librenms;
```
