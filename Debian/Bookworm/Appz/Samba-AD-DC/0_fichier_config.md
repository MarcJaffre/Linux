------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Création d'un fichier de configuration par hôte</p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Configuration du serveur Active-Directory
Le fichier suivant servira pour la configuration du serveur Linux. Il contient toute les variables utiles.
```bash
clear;
echo "#####################################
# Fichier de configuration #
############################
NOM=sldebian01
UTILISATEUR=marc

# Carte-Reseau
NET=ens18
RESEAU=192.168.10.0
IP=192.168.10.30
BR=192.168.10.255
MASK=255.255.255.0
GW=192.168.10.1
DNS1=192.168.10.1

# DHCP
DHCP_DEBUT='192.168.10.20'
DHCP_FIN='192.168.10.30'
MAC=$(ip add show $NET | grep ff:ff | cut -d "r" -f 2 | cut -c 2-18)

# SAMBA4
BOUCLAGE=127.0.0.1
DOMAINE1=lan
DOMAINE2=local
DOMAINE3=LAN
DOMAINE4=LOCAL
PASSWORD_ADMIN=Azerty74
ZONE_INVERSE=10.168.192.in-addr.arpa
#####################################" > /etc/os-ad; cat /etc/os-ad;
```


#### B. Configuration d'un Client Linux
```bash
clear;
echo "#####################################
# Fichier de configuration #
############################

NOM=hldebian01

DOMAINE1=lan
DOMAINE2=local

DOMAINE3=LAN
DOMAINE4=LOCAL

NET=ens18
BOUCLAGE=127.0.0.1
RESEAU=192.168.10.0
IP=192.168.10.6
BR=192.168.10.255
MASK=255.255.255.0
GW=192.168.10.1
DNS1=192.168.10.5

UTILISATEUR=marc
PASSWORD_ADMIN=Azerty74

MAC=$(ip add show $NET | grep ff:ff | cut -d "r" -f 2 | cut -c 2-18)

#####################################" > /etc/os-client; cat /etc/os-client;
```




https://www.aukfood.fr/teleport-une-solution-pour-votre-bastion-ssh/
