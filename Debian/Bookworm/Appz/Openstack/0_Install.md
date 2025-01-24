--------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation d'OpenStack </p>
--------------------------------------------------------------------------------------------------------------------------------
## I. Préparation du systèmes
### A. Dépôts
```bash
cat > /etc/apt/sources.list << EOF
###################################################################################################################
deb     http://ftp.fr.debian.org/debian/           bookworm          main non-free non-free-firmware contrib
deb-src http://ftp.fr.debian.org/debian/           bookworm          main non-free non-free-firmware contrib
###################################################################################################################
deb     http://security.debian.org/debian-security bookworm-security main non-free non-free-firmware contrib
deb-src http://security.debian.org/debian-security bookworm-security main non-free non-free-firmware contrib
###################################################################################################################
deb     http://ftp.fr.debian.org/debian/           bookworm-updates  main non-free non-free-firmware contrib
deb-src http://ftp.fr.debian.org/debian/           bookworm-updates  main non-free non-free-firmware contrib
###################################################################################################################
EOF
```

### B. Mise à jour
```bash
clear;
apt update 1>/dev/null;
apt upgrade -y;
```

### C. Network
```bash
clear;

cat > /etc/network/interfaces << EOF
auto lo
iface lo inet loopback
allow-hotplug ens18
iface ens18 inet static
 address 192.168.0.32/24
 gateway 192.168.0.1
 dns-nameservers 192.168.0.1 8.8.8.8
EOF
systemctl restart networking;
```

### D. Hostname
```bash
clear;
hostnamectl set-hostname openstack.home.lan
```

### E. Hosts
```
cat > /etc/hosts << EOF
# IP4
127.0.0.1       localhost
192.168.0.30    openstack.home.lan
# IPv6
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF
```

### F. Redémarrage
```bash
clear;
[ -e /var/run/reboot-required ] && reboot;
```

### G. NTP
```bash
clear;
sed -i -e "s/^\#NTP\=/NTP\=192.168.0.1/g" /etc/systemd/timesyncd.conf;
systemctl restart systemd-timesyncd;
```

### H. Configurer le Fuseau Horaire
```bash
clear;
timedatectl set-timezone Europe/Paris;
timedatectl set-ntp true;
timedatectl;
```


<br />

--------------------------------------------------------------------------------------------------------------------------------
##  II. Installation d'OpenStack
### A. Chrony
#### 1. Installation
```bash
clear;
apt -y install -y chrony;
```

#### 2. Configuration du NTP
```bash
clear;
sed -i -e "s/pool 2.debian.pool.ntp.org iburst/pool 0.fr.pool.ntp.org iburst/g" /etc/chrony/chrony.conf;
systemctl restart chrony;
```

### B. MariaDB
```bash
clear;
apt install -y mariadb-server;
sed -i -e "s/^\#max_connections        \= 100/max_connections        \= 700/g" /etc/mysql/mariadb.conf.d/50-server.cnf;
systemctl restart mariadb;
```

### C. Python
```bash
clear;
apt install -y python3-pymysql;
```

### D. Memcached
```bash
clear;
apt install -y memcached;
```

### E. Nginx web server
#### 1.
```bash
clear;
apt install -y nginx libnginx-mod-stream;
```

#### 2. Disable the default nginx web page.
```bash
clear;
unlink /etc/nginx/sites-enabled/default;
```

### F. RabbitMQ
#### 1. Installation
```bash
clear;
apt install -y rabbitmq-server;
```

#### 2. Ajoutez un utilisateur RabbitMQ pour OpenStack, définissez le mot de passe et accordez des autorisation
```bash
clear;
rabbitmqctl add_user openstack admin;
rabbitmqctl set_permissions openstack ".*" ".*" ".*";
```

### G. Relance des services
```bash
clear;
systemctl restart mariadb;
systemctl restart rabbitmq-server;
systemctl restart memcached;
systemctl restart nginx;
```


### H. Base de donnée
#### 1. Suppression de la BDD et USER
```bash
clear;
mysql -u root -padmin -e "DROP DATABASE IF EXISTS keystone"
mysql -u root -padmin -e "DROP USER IF EXISTS 'keystone'@'localhost';"
```

#### 2. Création de la BDD
```bash
clear;
mysql -u root -padmin -e "CREATE DATABASE IF NOT EXISTS keystone;"
```
#### 3. Création de l'utilisateur
```bash
clear;
mysql -u root -padmin -e "CREATE USER 'keystone'@'localhost' IDENTIFIED BY 'admin';"
```
#### 4. Permission de la BDD pour le compte
```bash
clear;
mysql -u root -padmin -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost';"
```
#### 5. Permettre l'authentification
```bash
clear;
mysql -u root -padmin -e "ALTER USER keystone@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('admin');"
```

### I. Keystone
L'installation de Keystone, requiert des dépendances. Le client OpenStack est installée. Répondre `NO` à toute les questions.
#### 1. Installation
```bash
clear;
apt install -y apache2;
apt install -y keystone
apt install -y libapache2-mod-wsgi-py3;
apt install -y python3-oauth2client;
apt install -y python3-openstackclient;
```

#### 2. Configuration de Keystone
```bash
clear;
sed -i -e "s/^\memcache_servers/memcache_servers/g"      /etc/keystone/keystone.conf;
sed -i -e "s/^\#provider \= fernet/provider \= fernet/g" /etc/keystone/keystone.conf;
```

```bash
[database]
connection = mysql+pymysql://keystone:admin@localhost/keystone
```

#### 3. Remplissez la base de données du service d’
```bash
clear;
su -s /bin/bash keystone -c "keystone-manage db_sync"
```

```bash
keystone-manage fernet_setup     --keystone-user keystone --keystone-group keystone;
keystone-manage credential_setup --keystone-user keystone --keystone-group keystone;
```

### J. 
```bash
clear;
```


### 
```bash
clear;
```



