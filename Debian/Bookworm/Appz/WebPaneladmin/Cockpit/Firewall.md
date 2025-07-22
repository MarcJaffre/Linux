--------------------------------------------------------------------------------------------------
# <p align='center'> Installation et configuration du Pare-feu Firewalld via Cockpit </p>
--------------------------------------------------------------------------------------------------
## I. Déploiement de Firewalld
### A. Installation du Paquet
```bash
clear;
apt install -y firewalld;
systemctl stop firewalld;
```

### B. Zones
Aller dans `Réseau` puis `Modifier les règles et les zones`. 
#### 1. Activation du Pare-feu
Pour gérer les zones, il faut que le pare-feu soit actif.

<br />

#### X. Public
Pour une utilisation dans les lieux **publics**. Vous ne faites pas confiance aux autres ordinateurs du réseau pour endommager le vôtre. Seules certaines connexions entrantes sont acceptées.

Ports ouvert par défaut:
```
- Cockpit
- DHCPv6-client
- SSH
```

<br />

#### X. External
Pour une utilisation sur des réseaux **externes**. Vous ne faites pas confiance aux autres ordinateurs du réseau pour endommager le vôtre. Seules certaines connexions entrantes sont acceptées.

Ports ouvert par défaut:
```
- Cockpit
- SSH
```

<br />

#### X. DMZ
Pour les ordinateurs de votre zone **démilitarisée** accessibles au public avec un accès limité à votre réseau interne. Seules certaines connexions entrantes sont acceptées.

Ports ouvert par défaut:
```
- Cockpit
- SSH
```

<br />

#### X. Work
À utiliser dans les espaces de **travail**. Vous faites généralement confiance aux autres ordinateurs du réseau pour ne pas endommager le vôtre. Seules certaines connexions entrantes sont acceptées.

Ports ouvert par défaut:
```
- Cockpit
- DHCPv6-client
- SSH
```

<br />

#### X. Home
Pour une utilisation **domestique**. Vous faites généralement confiance aux autres ordinateurs du réseau pour ne pas endommager le vôtre. Seules certaines connexions entrantes sont acceptées.

Ports ouvert par défaut:
```
- Cockpit
- DHCPv6-client
- mDNS
- Samba-Client
- SSH
```

<br />

#### X. Internal
Pour une utilisation sur les réseaux **internes**. Vous faites généralement confiance aux autres ordinateurs du réseau pour ne pas endommager le vôtre. Seules certaines connexions entrantes sont acceptées.

```
- Cockpit
- DHCPv6-client
- mDNS
- Samba-Client
- SSH
```
