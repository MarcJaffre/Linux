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
unlink /etc/nginx/sites-enabled/default
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


### 
```bash
clear;
```


### 
```bash
clear;
```


### 
```bash
clear;
```


### 
```bash
clear;
```



