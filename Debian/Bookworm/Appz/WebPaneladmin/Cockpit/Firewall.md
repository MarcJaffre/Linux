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

### B. Activation du Pare-feu
Aller dans `Réseau` puis `Modifier les règles et les zones`. 

### C. Gestions des Zones
Pour gérer les zones, il faut que le pare-feu soit actif.

Le champs `Adresses autorisées` permet de limité l'accès au ports ouvert par rapport à la source.

| Class | Adresse CIDR   |
| ----- | -------------- |
|   A   | 10.0.0.0/8     |
|   B   | 172.16.0.0/12  |
|   C   | 192.168.0.0/16 |


<br />

#### 1. Public (Non utiliser)
Pour une utilisation dans les lieux **publics**. Vous ne faites pas confiance aux autres ordinateurs du réseau pour endommager le vôtre. Seules certaines connexions entrantes sont acceptées.

Ports ouvert par défaut:
```
- Cockpit
- DHCPv6-client
- SSH
```

<br />

#### 2. External (Utilisé)
Pour une utilisation sur des réseaux **externes**. Vous ne faites pas confiance aux autres ordinateurs du réseau pour endommager le vôtre. Seules certaines connexions entrantes sont acceptées.

Ports ouvert par défaut:
```
- Cockpit
- SSH
```

<br />

#### 3. DMZ (Non utiliser)
Pour les ordinateurs de votre zone **démilitarisée** accessibles au public avec un accès limité à votre réseau interne. Seules certaines connexions entrantes sont acceptées.

Ports ouvert par défaut:
```
- Cockpit
- SSH
```

<br />

#### 4. Work (Non utiliser)
À utiliser dans les espaces de **travail**. Vous faites généralement confiance aux autres ordinateurs du réseau pour ne pas endommager le vôtre. Seules certaines connexions entrantes sont acceptées.

Ports ouvert par défaut:
```
- Cockpit
- DHCPv6-client
- SSH
```

<br />

#### 5. Home (Non utiliser)
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

#### 6. Internal (Non utiliser)
Pour une utilisation sur les réseaux **internes**. Vous faites généralement confiance aux autres ordinateurs du réseau pour ne pas endommager le vôtre. Seules certaines connexions entrantes sont acceptées.

```
- Cockpit
- DHCPv6-client
- mDNS
- Samba-Client
- SSH
```
