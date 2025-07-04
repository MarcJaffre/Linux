------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Déploiement de WikiJS </p>
------------------------------------------------------------------------------------------------------------------------------------
## I. WIkiJS
### A. Téléchargement de WikiJS
```bash
clear;
wget https://github.com/Requarks/wiki/releases/latest/download/wiki-js.tar.gz -O /tmp/wiki-js.tar.gz;
```
Code retour:
```
requête HTTP transmise, en attente de la réponse… 302 Found
requête HTTP transmise, en attente de la réponse… 200 OK
```

### B. Création du dossier wiki
```bash
clear;
mkdir /var/wiki;
```

### C. Extraction du fichier compression dans le Wiki
```bash
clear;
tar xzf /tmp/wiki-js.tar.gz -C /var/wiki;
```

### D. Permission
Le service tourne en Nobody, le propriétaire doit être en Nobody.
```bash
clear;
chown -R nobody /var/wiki;
```

### E. Fichier de configuration
#### 1. Copie de fichier
```bash
clear;
cd /var/wiki;
cp config.sample.yml config.yml;
```
#### 2. Edition de la configuration
```bash
nano config.yml
```

```
db:
  type: mariadb
  host: localhost
  port: 3306
  user: wikijs
  pass: wikijsrocks
  db: wiki
```


### F. SystemD
#### 1. Création du service
Le service démarre après le service `Network`, le processus tourne en tant qu'utilisateur `Nobody`, et le dossier de travail est `/var/wiki`.

```bash
clear;
nano /etc/systemd/system/wiki.service;
```

```bash
[Unit]
Description=Wiki.js
After=network.target

[Service]
Type=simple
User=nobody
WorkingDirectory=/var/wiki
ExecStart=/usr/bin/node server
Environment=NODE_ENV=production
Restart=always

[Install]
WantedBy=multi-user.target
```

#### 2. Gestion du service
```bash
clear;
systemctl daemon-reload;
systemctl restart wiki;
systemctl status  wiki;
systemctl enable  wiki;
```
