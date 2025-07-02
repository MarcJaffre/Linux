----------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation de PHP LDAP-ADMIN </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
```
Le serveur à comme IPv4 192.168.10.30 et le nom de domaine est LAN.LOCAL.
```

```
Attention : phpLDAPadmin ne fonctionne pas avec la version php égale ou supérieur à 7.2 !!!!)
```

```
https://www.youtube.com/watch?v=6ls6kRvGkrU
https://bitsparadise.info/index.php/2020/11/11/mise-en-place-dun-service-ldap-avec-dopenldap-et-phpldapadmin/
```
<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Installation

#### A. Installation de pacakage
```bash
clear;
apt install -y slapd;
apt install -y ldap-utils;
```

#### B. Configuration de ldap
```bash
clear;
cp  /etc/ldap/ldap.conf  /etc/ldap/ldap.conf.old;
echo "# ============================================
BASE dc=LAN,dc=LOCAL
URI ldap://192.168.10.30:389
TLS_CACERT /etc/ssl/certs/ca-certificates.crt
# ============================================" > /etc/ldap/ldap.conf;

# Tester la config : ldapsearch -x;
```

#### C. Configuration de slapd
```bash
clear;
dpkg-reconfigure slapd;
# No
# lan.local
# lan
# <password administrateur>
# MDB
# NO
# YES
```


#### D. Installation de phpldapadmin
```bash
clear;
apt install -y phpldapadmin;
```

#### E. Configuration de phpldapadmin
```bash
clear;
nano /etc/phpldapadmin/config.php;
# $config->custom->appearance['timezone'] = 'Europe/Paris';
# $servers->setValue('login','bind_id','CN=ldap,dc=LAN,dc=LOCAL');
# $servers->setValue('server','base',array('dc=LAN,dc=LOCAL'));
# $servers->setValue('server','name','Active Directory du serveur WINSRV19A');
# $servers->setValue('server','host','192.168.10.30');
```

#### F. Relance des services
```bash
clear;
systemctl restart apache2;
systemctl restart slapd;
systemctl --failed;
```


```bash
clear;
http://192.168.10.30/phpldapadmin
```
<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Client messagerie
```
Nom: LDAP
Nom d'hôte: 192.168.10.30
Nom distinct: dc=lan,dc=local
Port: 389
```
