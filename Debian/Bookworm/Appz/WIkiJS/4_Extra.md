---------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Autoriser l'utilisation du port 80 <p/>
---------------------------------------------------------------------------------------------------------------------------------------
## I. Debian
### A. Sysctl
#### 1. Edition du fichier de configuration
```bash
clear;
nano /etc/sysctl.conf;
```
#### 2. Variable
```
# Autoriser le port 80 en utilisateur
net.ipv4.ip_unprivileged_port_start=80
```

#### 3. Rechargement
```bash
sysctl --load;
```

### B. Configuration
#### 1. Edition du fichier de configuration
```bash
clear;
nano /var/wiki/config.yml;
```
#### 2. Port
```
# Port HTTP
port: 80

# Base de donnee
db:
  type: mariadb
  host: localhost
  port: 3306
  user: wikijs
  pass: wikijsrocks
  db:   wiki
  ssl:  false
```

```
port: 80
```

