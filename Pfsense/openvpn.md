------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> [Installation de OpenVPN sur Pfsense](https://neptunet.fr/openvpn-pfsense/#2) </p>

------------------------------------------------------------------------------------------------------------------------------------------------
### I. Installation du serveur OpenVPN

#### X. Les Réseaux
```
Réseau Physique : 192.168.1.0/24   (Box)
Réseau Physique : 192.168.0.0/24   (Routeur)
Réseau Virtuelle: 192.168.10.0/24  (DMZ)
Réseau Virtuelle: 192.168.100.0/24 (LAN)
Réseau Virtuelle: 192.168.200.0/24 (VPN)
```

#### X. Appareils:
```
Box     : 192.168.1.1
Routeur : 192.168.1.100 (WAN) | 192.168.0.1   (LAN)
Pfsense : 192.168.0.4   (WAN) | 192.168.100.1 (LAN) | 192.168.200.1 (VPN)
```

#### X. Ouvrir l'assistant de création OpenVPN
```
- VPN
- OpenVPN
- Assistant
```

------------------------------------------------------------------------------------------------------------------------------------------------
### II Local User Access
#### X. Create a New Certificate Authority (CA) Certificate
```
Nom descriptif     : ca_pfsense
Longueur de la clé : 2048 bit (Defaut)
Durée de vie       : 3650 Jours (Defaut)
Nom commun         : pfsense.home
Code du pays       : FR
État ou province   : Auvergne
Ville              : Gaillard
Organisation       : Personnel
```

![image](https://github.com/dexter74/Linux/assets/35907/5d848379-0820-45c3-b841-f832ee47c8fe)

![image](https://github.com/dexter74/Linux/assets/35907/65019344-e212-4d5d-ad3c-6eff41490f9f)

#### X. Create a New Server Certificate
```
Nom descriptif     : certificat_pfsense
Longueur de la clé : 2048 bit (Defaut)
Durée de vie       : 398 Jours (Defaut)
Code du pays       : CH
État ou province   : Suisse
Ville              : Genève
Organisation       : Personnel
```

#### X. Configuration du VPN
```
General OpenVPN Server Information:
 > Interface                  : WAN (Defaut)
 > Protocole                  : UDP on IPV4 (Defaut)
 > Local Port                 : 1194 (Defaut)
 > Description                : OpenVPN

Paramètres cryptographiques:
 > Authentification TLS       : Cocher (Defaut)
 > Generate TLS Key           : Cocher (Defaut)
 > DH Parameters Length       : 2048 (Defaut)
 > Encryption Algorithm       : AES-128-CBC (128 key, 128 block)
 > Auth Digest Algorithm      : SHA (256-bit)
 > Chiffrement matériel       : Pas d'accélération cryptographique matérielle

Paramètres du tunnel:
 > Réseau tunnel              : 192.168.200.0/24
 > Rediriger la passerelle    : Cocher (Force les paquets dans le VPN)
 > IPv4 Local Network         : 192.168.0.0/24, 192.168.1.0/24, 192.168.10.0/24, 192.168.100.0/24, 192.168.200.0/24
 > Concurrent Connections     : 
 > Compression                : 
 > Type de service            : 
 > Inter-Client Communication : 
 > Duplicate Connections      : 

Paramètres du client:
 > Topologie                  :

Paramètres clients avancés:
 > IP dynamique               : Cocher
 > Domaine DNS par défaut     : VPN
 > Serveur DNS 1              : 192.168.200.1
 > Serveur DNS 2              : 192.168.0.1
 > Serveur DNS 3              : 8.8.8.8
 > Serveur DNS 4              : 
 > NTP Server                 : 
 > Serveur NTP 2              : 
 > Options NetBIOS            : 
 > NetBIOS Node Type          : 
 > NetBIOS Scope ID           : 
 > Serveur WINS 1             : 
 > Serveur WINS 2             :


Traffic from clients to server
 > Firewall Rule              : Cocher

Traffic from clients through VPN
 > OpenVPN rule               : Cocher
```

#### X. Affectation de l'interface
Aller dans Interface puis Affectation.

Cliquer sur Ajouter

![image](https://github.com/dexter74/Linux/assets/35907/e7fb9d27-2cb6-474a-886b-8048bad04d5d)

Relancer PfSense.


#### X. Gestionnaire d'usagers
Il faut créer un utilisateur et son certificat dédiée . 

Information: Le compte `Admin` n'a pas de certificat client.

![image](https://github.com/dexter74/Linux/assets/35907/0a3e152a-7d9a-4c8e-aee2-d89ba4e9c2e6)

![image](https://github.com/dexter74/Linux/assets/35907/2363b6ff-6631-4fb6-9abb-27fa2183ec60)


#### X. Gestionnaire de paquets
Installer dans les paquets Disponibles le paquet `openvpn-client-export`

#### X. Exporter configuration cliente
Aller dans l'onglet `VPN` puis `OpenVPN` puis `Client Export`.



#### X. Règle de Pare-Feu Wan
Lors de la création le protocole choisis était le suivant.

![image](https://github.com/dexter74/Linux/assets/35907/d6ae5d25-a3d7-469d-9cf7-44c20163ba64)

![image](https://github.com/dexter74/Linux/assets/35907/254f2700-da5f-48a4-9385-643266f921b7)

