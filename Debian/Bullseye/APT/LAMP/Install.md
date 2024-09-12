------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation du serveur LAMP </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Installation
#### A. Apache
##### 1. Installation
```bash
clear;
apt install -y apache2;
apt install -y openssl;
```
##### 2. Certificat SSL
```bash
clear;

# Chemin du certificat
PATH_KEY="/etc/apache2/ssl/"

# Nom du certificat
NOM="web01"

# Taille:
SIZE_KEY="4096"

# Information sur le certificat
COUNTRY_NAME="FR"
PROVINCE="France"
REGION="France"
VILLE=""
ORGANISATION="Personnel"
FQDN=""
EMAIL="m@m.com"
DUREE="3650"

mkdir -p "$PATH_KEY";
openssl genrsa $SIZE_KEY > $PATH_KEY/$NOM.key 2>/dev/null;
(echo "$COUNTRY_NAME"; echo "$PROVINCE"; echo "$REGION"; echo "$VILLE";echo "$ORGANISATION";echo "$ORGANISATION";echo "$FQDN";echo "$EMAIL") | openssl req -new -key $PATH_KEY/$NOM.key -x509 -days $DUREE -out $PATH_KEY/$NOM.pem 2>/dev/null;
```

##### 3. Activation des modules
```bash
clear;
/usr/sbin/a2enmod rewrite ssl headers 1>/dev/null;
systemctl restart apache2 2>/dev/null;
```

##### 4. Prise en charge du SSL
```bash
clear;
/usr/sbin/a2dissite default-ssl;
cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.old;

cat > /etc/apache2/sites-available/default-ssl.conf << EOF
<IfModule mod_ssl.c>
	<VirtualHost _default_:443>
			ServerAdmin webmaster@localhost
			ServerName debian.lan
			DocumentRoot /var/www/html
			ErrorLog   ${APACHE_LOG_DIR}/error.log
			CustomLog  ${APACHE_LOG_DIR}/access.log combined
			SSLEngine on
			SSLCertificateFile    /etc/apache2/ssl/web01.pem
			SSLCertificateKeyFile /etc/apache2/ssl/web01.key
			<FilesMatch "\.(cgi|shtml|phtml|php)$">
				SSLOptions +StdEnvVars
			</FilesMatch>
			<Directory /usr/lib/cgi-bin>
				SSLOptions +StdEnvVars
			</Directory>
			<IfModule mod_headers.c>
				Header always set Strict-Transport-Security "max-age=15552000; >
			</IfModule>
	</VirtualHost>
</IfModule>
EOF

/usr/sbin/a2ensite default-ssl;
systemctl restart apache2;
systemctl reload apache2;
```

<br />

#### B. MariaDB
##### 1. Installation du paquet
```bash
clear;
apt install -y default-mysql-server;
```
##### 2. Sécuriser MariaDB
```bash
ROOT_DB_PASS=admin
(echo ""; echo "y"; echo "y"; echo "$ROOT_DB_PASS"; echo "$ROOT_DB_PASS"; echo "y"; echo "y"; echo "y"; echo "y") | mysql_secure_installation | 1>/dev/null;
```
##### 3. Autoriser l'authentification passive
```bash
clear;
mysql -u root -p${ROOT_DB_PASS} -e "ALTER USER root@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('admin');"
```
##### 4. Vérification de la connexion SQL
```bash
clear;
mysql -u root -p${ROOT_DB_PASS} -e "SHOW DATABASES;"
```

<br />

#### C. PHP
##### 1. Installation de PHP
```bash
clear;
apt install -y php;
```

##### 2. Module Apache
Ce paquet fournit le module PHP pour le serveur web Apache 2.
```bash
clear;
apt install -y libapache2-mod-php;
```

##### 3. Relance Apache
Le service Apache lance PHP et PHP charge les modules PHP-*.
```bash
clear;
systemctl restart apache2;
```
