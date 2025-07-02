------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> [Installation d'un serveur Active Directory sous Linux](https://github.com/dexter74/Archives/blob/main/Linux/V2/Debian/Paquet/Samba4/) </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Installation de l'Active Directory
#### A. Désactiver Avahi
```bash
clear;
systemctl disable --now avahi-daemon.service 2>/dev/null;
systemctl disable --now avahi-daemon.socket  2>/dev/null;
```

#### B. Installation des utilitaires
```bash
clear;
apt install -y apt-transport-https 1>/dev/null;
apt install -y curl                1>/dev/null;
apt install -y dnsutils            1>/dev/null;
apt install -y gnupg               1>/dev/null;
apt install -y htop                1>/dev/null;
apt install -y lsb-release         1>/dev/null;
apt install -y net-tools           1>/dev/null;
apt install -y nmap                1>/dev/null;
apt install -y rsync               1>/dev/null;
apt install -y screen              1>/dev/null;
apt install -y sudo                1>/dev/null;
apt install -y tcpdump             1>/dev/null;
apt install -y telnet              1>/dev/null;
apt install -y vim                 1>/dev/null;
apt install -y wget                1>/dev/null;
```


#### C. Dépôt Samba-AD
```bash
clear;
wget -qO-  https://samba.tranquil.it/tissamba-pubkey.gpg | tee /usr/share/keyrings/tissamba.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/tissamba.gpg] https://samba.tranquil.it/debian/samba-4.18/ $(lsb_release -c -s) main" > /etc/apt/sources.list.d/tissamba.list;
apt update 1>/dev/null;
```

#### D. Installation de Samba-AD
```bash
clear;
export DEBIAN_FRONTEND=noninteractive
apt install -y ldb-tools              1>/dev/null;
apt install -y libnss-winbind         1>/dev/null;
apt install -y krb5-user              1>/dev/null;
apt install -y python3-cryptography   1>/dev/null;
apt install -y samba                  1>/dev/null;
apt install -y smbclient              1>/dev/null;
apt install -y winbind                1>/dev/null;
unset DEBIAN_FRONTEND
```

#### E. Configurer le Nom de domaine
```bash
clear;
source /etc/os-ad;
echo "[libdefaults]
  default_realm = $DOMAINE3.$DOMAINE4
  dns_lookup_kdc = true
  dns_lookup_realm = false" > /etc/krb5.conf;
```

#### F. Configuration Samba en Contrôleur de Domaine
```bash
clear;
source /etc/os-ad;
rm -f /etc/samba/smb.conf;
samba-tool domain provision --realm=$DOMAINE3.$DOMAINE4 --domain $DOMAINE3 --server-role=dc;
```

#### G. Définir le mot de passe du compte administrateur
```bash
clear;
source /etc/os-ad;
samba-tool user setpassword --newpassword=$PASSWORD_ADMIN administrator;
samba-tool user setexpiry administrator --noexpiry;
```

#### H. Vérification du DNS
```bash
clear;
cat /etc/samba/smb.conf | grep  "dns forwarder";
```

#### I. Configurer Resolvconf
```bash
clear;
source /etc/os-ad;
sed -i -e "s/$DNS1/$BOUCLAGE/g" /etc/resolv.conf;
```

#### J. Création d'un liens symbolique
```bash
clear;
rm -f /var/lib/samba/private/krb5.conf;
ln -s /etc/krb5.conf /var/lib/samba/private/krb5.conf;
```

#### K. Activation des services
```bash
clear;
systemctl disable nmbd;
systemctl disable samba;
systemctl disable smbd;
systemctl disable winbind;

systemctl mask    samba;
systemctl mask    nmbd;
systemctl mask    smbd;
systemctl mask    winbind;

systemctl unmask samba-ad-dc;
systemctl enable samba-ad-dc;
reboot;
```

#### L. Création de la zone inversée
```bash
clear;
source /etc/os-ad;

# Suppression
samba-tool dns zonedelete $NOM $ZONE_INVERSE --username=administrator --password=$PASSWORD_ADMIN 1>/dev/null;

# Creation
samba-tool dns zonecreate $NOM $ZONE_INVERSE --username=administrator --password=$PASSWORD_ADMIN 1>/dev/null;

samba-tool dns add $NOM.$DOMAINE1.$DOMAINE2 $ZONE_INVERSE 55 PTR $NOM.$DOMAINE1.$DOMAINE -U administrator 1>/dev/null;
```

#### M. Tester l'Active Directory
```bash
clear;
source /etc/os-ad;
echo "$PASSWORD_ADMIN" | /usr/bin/kinit administrator;
```

#### N. Tester le DNS
```bash
clear;
source /etc/os-ad;
dig @localhost google.fr;
dig @localhost $NAME.$DOMAINE1.$DOMAINE2;
dig -t SRV @localhost _ldap._tcp.$DOMAINE1.$DOMAINE2;
```

<br />



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Installation de Cockpit
#### A. 
```bash
clear;
```

#### X. 
```bash
clear;
```

#### X. 
```bash
clear;
```

#### X. 
```bash
clear;
```

#### X. 
```bash
clear;
```

#### X. 
```bash
clear;
```


<br />


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### V. Prise de note
#### A. 
```bash
clear;
```

#### B. Connaître le niveau fonctionnel du serveur 
```bash
clear;
samba-tool domain level show
```

#### C. Ajouter un Utilisateur dans l'AD
```bash
clear;
/usr/bin/samba-tool user create \
--userou='CN=Users' \
--surname='Marc' \
--given-name='Jaffre' \
--initials='JM' \
--job-title='Technicien' \
--department='Informaticien' \
--company='Entreprise Name' \
--mail-address='marc.jaffre@lan.local' \
--internet-address='www.google.fr' \
--telephone-number='0123456789' \
--color='always' \
--password='Azerty74' \
marc

/usr/bin/samba-tool user list;
/usr/bin/samba-tool group addmembers Administrators marc;
/usr/bin/samba-tool group show Administrators;
/usr/bin/samba-tool user setexpiry marc --noexpiry;
/usr/bin/samba-tool user enable marc;
/usr/bin/samba-tool user unlock marc;

echo "$PASSWORD_ADMIN" | /usr/bin/kinit marc;

/usr/bin/samba-tool group removemembers Administrators marc;
```


#### D. Lister les ordinateurs
```bash
clear;
/usr/bin/samba-tool computer list;
```
