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
### A. Paquets
#### 1. Indispensables
```bash
clear;
apt install -y lsb-release;
apt install -y ca-certificates;
apt install -y wget;
apt install -y acl;
apt install -y curl;
apt install -y fping;
apt install -y git;
apt install -y graphviz;
apt install -y imagemagick;
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
```
#### 2. PHP-8
```bash
clear;
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg 2>/dev/null;
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list;
apt update 1>/dev/null;
apt install -y php 1>/dev/null;
php -v | head -n 1 | cut -c 5-7;
```
#### 3. Extension PHP-8
```bash
clear;
apt install -y php-{cli,curl,fpm,gd,gmp,mbstring,mysql,snmp,xml,zip};
```

#### 4. Fuseau Horaires
```bash
clear;
PHP_VERSION=$(php -v | head -n 1 | cut -c 5-7)
sed -i -e "s/^\;date.timezone \=/date.timezone \= Europe\/Paris/g" /etc/php/$PHP_VERSION/fpm/php.ini;
sed -i -e "s/^\;date.timezone \=/date.timezone \= Europe\/Paris/g" /etc/php/$PHP_VERSION/cli/php.ini;
```


### B. Utilisateur
```bash
clear;
useradd librenms -d /opt/librenms -M -r -s "$(which bash)";
```

### C. Télécharger LibreNMS
```bash
clear;
git clone https://github.com/librenms/librenms.git /opt/librenms 2>/dev/null;
```

### D. Permissions
```bash
clear;
chown -R librenms:librenms /opt/librenms;
chmod 771 /opt/librenms;
setfacl -d -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/;
setfacl -R -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/;
```

### E. Script Composer Wrapper
```bash
clear;
runuser -l librenms -c './scripts/composer_wrapper.php install --no-dev';
```

### F. MariaDB
#### 1. Edition
```bash
clear;
sed -i -e "s/\[mysqld\]/\[mysqld\]\ninnodb\_file\_per\_table\=1\nlower\_case\_table\_names\=0/g" /etc/mysql/mariadb.conf.d/50-server.cnf;
```
#### 2. Services
```bash
clear;
systemctl restart mariadb;
systemctl enable --now mariadb;
```

#### 3. Sécurisation
```bash
clear;
MARIADB_PASS_ROOT_SQL="admin"
(echo ""; echo "y"; echo "y"; echo "$MARIADB_PASS_ROOT_SQL"; echo "$MARIADB_PASS_ROOT_SQL"; echo "y"; echo "n"; echo "y"; echo "y") | mysql_secure_installation;
```

#### 4. BDD + Accès
```bash
clear;
mysql -u root -padmin -e "DROP DATABASE IF EXISTS librenms;DROP USER IF EXISTS 'librenms'@'localhost';"
mysql -u root -padmin -e "CREATE DATABASE IF NOT EXISTS librenms;"
mysql -u root -padmin -e "CREATE USER 'librenms'@'localhost' IDENTIFIED BY 'admin';"
mysql -u root -padmin -e "GRANT ALL PRIVILEGES ON librenms.* TO 'librenms'@'localhost';"
mysql -u root -padmin -e "ALTER USER librenms@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('admin');"
mysql -u librenms -padmin -e "SHOW DATABASES;"

mysql_upgrade --force;
```


```bash
clear;
mysql -u root -padmin -e "DROP DATABASE IF EXISTS librenms";
mysql -u root -padmin -e "DROP USER IF EXISTS 'librenms'@'localhost';"
mysql -u root -padmin -e "SELECT User FROM mysql.user; SHOW DATABASES;"
mysql -u root -padmin -e "CREATE DATABASE IF NOT EXISTS librenms CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -u root -padmin -e "CREATE USER IF NOT EXISTS 'librenms'@'localhost' IDENTIFIED BY 'PASSSWORD123';"
mysql -u root -padmin -e "GRANT ALL PRIVILEGES ON librenms.* TO 'librenms'@'localhost';"
mysql -u root -padmin -e "ALTER USER librenms@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('PASSSWORD123');"
mysql -u root -padmin -e "SELECT User FROM mysql.user; SHOW DATABASES;"
mysql -u librenms -pPASSWORD123 -e "SHOW DATABASES;"
```



### G. PHP-FPM
#### 1. Librenms.conf
```bash
clear;
PHP_VERSION=$(php -v | head -n 1 | cut -c 5-7)
cat /etc/php/$PHP_VERSION/fpm/pool.d/www.conf > /etc/php/$PHP_VERSION/fpm/pool.d/librenms.conf;
```
#### 2. Remplacement de terme
```bash
clear;
sed -i -e "s/\[www\]/\[librenms\]/g"                 /etc/php/$PHP_VERSION/fpm/pool.d/librenms.conf;
sed -i -e "s/^user \= www-data/user \= librenms/g"   /etc/php/$PHP_VERSION/fpm/pool.d/librenms.conf;
sed -i -e "s/^group \= www-data/group \= librenms/g" /etc/php/$PHP_VERSION/fpm/pool.d/librenms.conf;
sed -i -e "s/\/run\/php\/php8.3\-fpm.sock/\/run\/php\-fpm\-librenms.sock/g" /etc/php/$PHP_VERSION/fpm/pool.d/librenms.conf;

grep "librenms" /etc/php/$PHP_VERSION/fpm/pool.d/librenms.conf;
```

#### 3. VirtualHost
```bash
clear;
rm /etc/nginx/sites-enabled/default 2>/dev/null;

cat > /etc/nginx/sites-enabled/librenms.vhost << EOF
server {
 listen      80;
 server_name 192.168.0.34;
 root        /opt/librenms/html;
 index       index.php;

 charset utf-8;
 gzip on;
 gzip_types text/css application/javascript text/javascript application/x-javascript image/svg+xml text/plain text/xsd text/xsl text/xml image/x-icon;
 location / {
  try_files \$uri \$uri/ /index.php?\$query_string;
 }
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
#### 4. Appliquer changement
```bash
clear;
PHP_VERSION=$(php -v | head -n 1 | cut -c 5-7)
systemctl reload nginx
systemctl restart php$PHP_VERSION-fpm;
```

### H. LNMS
```bash
clear;
ln -s /opt/librenms/lnms /usr/bin/lnms
cp /opt/librenms/misc/lnms-completion.bash /etc/bash_completion.d/
```
### I. SNMP
```bash
clear;
cp /opt/librenms/snmpd.conf.example /etc/snmp/snmpd.conf;
sed -i -e "s/RANDOMSTRINGGOESHERE/librenms/g" /etc/snmp/snmpd.conf;
```

### I. Agent
```bash
clear;
curl -o /usr/bin/distro https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/distro;
chmod +x /usr/bin/distro;
systemctl enable  snmpd;
systemctl restart snmpd;
```

### J. Cron
```bash
clear;
cp /opt/librenms/dist/librenms.cron /etc/cron.d/librenms;
```

### K. Scheduler Timer 
```bash
clear;
cp /opt/librenms/dist/librenms-scheduler.service /opt/librenms/dist/librenms-scheduler.timer /etc/systemd/system/
systemctl enable librenms-scheduler.timer;
systemctl start  librenms-scheduler.timer;
```

### L. LogRotate
```bash
clear;
cp /opt/librenms/misc/librenms.logrotate /etc/logrotate.d/librenms;
```

### M. Permission
```bash
clear;
chown -R librenms:librenms /opt/librenms
chmod 771 /opt/librenms
setfacl -d -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
setfacl -R -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
```

### N. Env
```bash
clear;
sed -i -e "s/\#DB_HOST\=/DB_HOST\=localhost/g" /opt/librenms/.env
sed -i -e "s/\#DB_DATABASE\=/DB_DATABASE\=librenms/g" /opt/librenms/.env
sed -i -e "s/\#DB_USERNAME\=/DB_USERNAME\=librenms/g" /opt/librenms/.env
sed -i -e "s/\#DB_PASSWORD\=/DB_PASSWORD\=admin/g" /opt/librenms/.env
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------




