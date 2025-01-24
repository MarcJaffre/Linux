--------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation MariaDB, RabbitMQ, Memcached </p>
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
sed -i -e "s/^\#connection \= <None>/connection \= mysql\+pymysql\:\/\/keystone\:admin\@localhost\/keystone/g"    /etc/keystone/keystone.conf;
```


#### 3. Remplissez la base de données du service
Une erreur est présent sur Pyhton3.11.
```bash
clear;
su -s /bin/bash keystone -c "keystone-manage db_sync"
```

```bash
keystone-manage fernet_setup     --keystone-user keystone --keystone-group keystone;
keystone-manage credential_setup --keystone-user keystone --keystone-group keystone;
```


### J. Amorcez le service d’identité
```bash
clear;
export controller=$(hostname -f)

keystone-manage bootstrap --bootstrap-password StrongPassw0rd01 \
--bootstrap-admin-url https://$controller:5000/v3/ \
--bootstrap-internal-url https://$controller:5000/v3/ \
--bootstrap-public-url https://$controller:5000/v3/ \
--bootstrap-region-id RegionOne
```


### 
```bash
clear;
```



