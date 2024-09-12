---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'>.: Mise en place d'un Pare-feu PfSense sous VirtualBox :.<p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
### X. Présentation de PfSense
**PfSense** est un **système d'exploitation** open source ayant pour but la mise en place de **routeur / pare-feu** basé sur le système d'exploitation **FreeBSD**.

Avant de concevoir votre machine virtuelle, il faut connaitre les **Minimum Hardware Requirements** de PfSense.

Pour de meilleur performance, on augmentera le nombre de coeur pour le CPU. (2 Core)

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/fa785a4a-74c3-4c83-9b92-dfffb8e045d0' /> </p>

<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
### X. Création de la Machine Virtuelle PfSense

#### X. Création du réseau WAN

Pour créer un réseau, il suffit de mettre le curseur sur la zone `Outil` puis cliquer sur le petit logo ![image](https://github.com/dexter74/Linux/assets/35907/17ab017b-05be-48e5-83b6-074ff126b9bd), et choisir `Réseau`.

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/7be4407f-2465-4d2b-8bde-5cbdcb0cc60a' /> </p>

Ensuite il faut aller dans `Nat Networks` et cliquer sur `Créer`. 

Puis il faut définir 
```
- Nom         : LAN
- IPv4 Préfix : 192.168.24.0/24
- Enable DHCP : Décocher
```

#### X. Télécharger l'image de PfSense
Aller sur le `site de pfsense` puis aller dans la page `Download`.
```
- Architecture: AMD64
- Installer   : DVD Image (ISO) Installer
- Mirror      : Pays où est stocké l'image ISO.
```

<br />

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/3467840e-3383-45da-837e-8200f9fc202f' /> </p>


#### X. Extraire le fichier
Le fichier télécharger à comme extension gz (`pfSense-CE-X.X.X-RELEASE-amd64.iso.gz`), il faut commencer par extraire le contenu de ce fichier via un logiciel de décompression (7zip)

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/f55b4392-45bf-4ad7-9ea6-d753dca3a1c8' /> </p>

#### X. Création de la Machine Virtuelle
Lors de la création de la VM, il faut indiquer le `Type` en `BSD`, puis la `Version` en `FreeBSD (64-bit)`

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/4ff461ed-4cd8-4009-b723-3a1d56e13ab3' /> </p>

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/4b5c769c-bc2b-493e-9339-92458941d280' /> </p>

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/ad8c1319-1f31-4adb-9977-7acb7dedf197' /> </p>

#### X. Configurer la Machine Virtuelle PfSense
```
- Ouvrir Virtualbox
- Sélectionner la VM de PfSense
- Clique droit sur la VM
- Configuration
 > Onglet Réseau
  > Adapater 1:
    > Activer l'interface réseau: Cocher
    > Mode d'accès réseau: Accès par pont
  > Adapter 2: 
    > Activer l'interface réseau: Cocher
    > Mode d'accès réseau: Réseau NAT
      > Name:  LAN
    > Avanced
     > Mode promiscuité: Allow VMs
```

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/93ca221b-968d-438a-a071-8f86cb261581' /> </p>

<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
### X. Installation de PfSense

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/a352142d-30c2-4af5-b081-c64baba0a071' /> </p>

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/56729935-8cd0-4e4e-91a3-30b81aca9bfa' /> </p>

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/daabf377-bb6c-498f-bbb4-24544ee0d67a' /> </p>

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/1749ff45-b732-4c40-b4e1-d19d3cf08c14' /> </p>


Pour sélectionner le disque, il faut faire la touche espace, suite à celà une étoile : `[*] ada0 VBOX HARDDISK`

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/d4a4e26f-fe6d-47e3-879f-0b053f12104d' /> </p>

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/128467e0-fcec-467d-9fe4-7979a31a8399' /> </p>

Ne pas faire entrée, il faut d'abord éjecter le CD.

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/3d48fbab-5192-489e-8f5d-ec9cee814cb0' /> </p>

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/758858bb-9e31-470a-839f-23fad487c79c' /> </p>

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/a66d62b8-1e7f-4dc3-b102-efc5b3e1fc7d' /> </p>

Valider le reboot en faisant entrée.

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/dc1a010a-715b-4a9e-8142-2589eedb889d' /> </p>

Taper la commande reboot puis entrer.



-------------------------------------------------------------------------------------------------------------------------------------------------------------
### X. Configuration de PfSense (Console)

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/4f2b4c8b-9de2-4b54-8a93-ccb4aa0b7edc' /> </p>

#### X. Rappel des Interfaces, zones, Réseaux
```
Une interface virtuel se nomme emX. (X étant le numéro de l'interface)
```

**Réseau NAT network**:
```
Un réseau Nat Network, consomme les 2 premières IP.
 - L'adresse IP X.X.X.1 est la passerelle
 - L'adresse IP X.X.X.2 est le serveur DHCP (Même désactiver, l'ip est consommée)
```


#### X. Assigner les Interfaces au Zone du Pare-Feu
Dans la configuration de la VM, nous avons 2 carte-réseaux et dans un ordre précis, sous pfSense c'est le même ordre sauf qu'elle porte un nom différente.

Nous allons définir les carte-réseaux aux zones (WAN, LAN).

Sélectionner le Menu 1: `Assign Interfaces`


<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/5d404d7f-b384-4049-827c-1e7cef0a27b3' /> </p>

On peut voir nos deux Interfaces (em0 et em1) qui sont en ligne (UP).

Em0 est la première interface, c'est donc mon WAN.

Em1 est la seconde interface, c'est donc mon LAN.

```
Should VLANS be set up Now [y|n]                 : n
Enter then WAN interface name ... (em0 em1 or a) : em0
Enter then LAN interface name ... (em1 or a)     : em1
Do you want to proceed [y|n]                     : y
```

![image](
<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/55ff51b3-a4c6-4ec8-81cb-8fa8dfb45d1a' /> </p>


#### X. Configurer IP Réseau des interfaces
La 1ère carte réseau se nomme `em0`  et celle-ci est rattaché au réseau `Physique`. (CIDR: `192.168.1.0/24`)

La 2nde carte-réseau se nomme `em1` et celle-ci est rattaché au réseau NAT `LAN`. (CIDR: `192.168.24.0/24`)

Dans mon exemple:
```
- WAN: 192.168.1.100/24
- LAN: 192.168.24.1/24
```

Sélectionner le Menu 2: `Set Interface(s) IP address` puis configurer les interfaces comme ce qui suit.


```
##############################################################################
# Configuration de l'interface WAN #
####################################
Enter the number of the interface you wish to configure      : 1
- Configure IPv4 address WAN interface via DHCP ? (y/n)      : n
- Enter the new WAN IPv4 address                             : 192.168.1.100
- Enter the new WAN IPv4 subnet bit count (1 to 32)          : 24
- For a WAN, enter the new WAN IPv4 upstream gateway address : 192.168.1.1
- Configure IPv6 address WAN interface via DHCP6             : n
- Enter the new WAN IPv6 address                             : <ENTER>
- Do you wan yo enable DHCP Server on WAN ? (y/n)            : n
- Press <Enter> to continue                                  : <ENTER>

##############################################################################
# Configuration de l'interface LAN #
####################################
Enter the number of the interface you wish to configure      : 2
- Configure IPv4 address WAN interface via DHCP ? (y/n)      : n
- Enter the new WAN IPv4 address                             : 192.168.24.3
- Enter the new WAN IPv4 subnet bit count (1 to 32)          : 24
- For a WAN, enter the new WAN IPv4 upstream gateway address : <ENTRER>
- Should the gateway be set as the default gateway ? (y/n)   : y
- Configure IPv6 address WAN interface via DHCP6             : n
- Enter the new WAN IPv6 address                             : <ENTER>
- Do you wan yo enable DHCP Server on WAN ? (y/n)            : n
- Press <Enter> to continue                                  : <ENTER>
```

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/a0278cc3-b473-4f14-a774-8210eb760ae5' /> </p>


#### X. Information
Par défaut, PfSense ne filtre rien du LAN vers l'extérieur. Il faudra créer une meilleur politique de sécuité.




<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
### X. Configuration des Postes clients
#### X. Configurer la Machine Virtuelle
```
- Ouvrir Virtualbox
- Sélectionner la VM du poste (Linux, Windows)
- Clique droit sur la VM
- Configuration
 > Onglet Réseau
  > Adapater 1:
    > Activer l'interface réseau: Cocher
    > Mode d'accès réseau: Réseau NAT
      > Name:  LAN
    > Avanced
     > Mode promiscuité: Allow VMs
```

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/8f457aa2-599a-44d4-be83-5b3495d6abde' /> </p>

#### X. Configurer l'adresse IPv4 en statique

```
Adresse IPv4  : 192.168.24.2
Masque de S/R : 255.255.255.0
Passerelle    : 192.168.24.1
Adresse DNS   : 192.168.24.1
```

<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
### X. Configuration de PfSense (Web-UI)
#### X. Accéder à l'interface Web de PfSense
```
Panel Web pfsense : http://192.168.24.1
Nom d'utilisateur : admin
Mot de passe      : pfsense
```


#### X. Démarrer l'installation en cliquant sur Next
##### Step 2: General Information

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/4fc55c4b-e394-4ddc-9b28-f991b90c73f2' /> </p>


##### Step 3: Time Server Information
Pour le TimeZone, choisir `Europe/Paris`.

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/3829af4a-5eea-44fd-a4ec-2d795a3e9bb8' /> </p>

##### Step 4: Configure WAN Interface
PfSense à été configuré depuis la console, il suffit d'indiquer la passerelle et de décocher les cases 'Block ...' pour permettre l'accès à internet à l'ensembles du réseau.

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/e528d1b2-cfad-495a-9b38-72ea3c77ddee' /> </p>

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/30b68561-ea80-4e55-b15a-a3a917becc02' /> </p>

##### Step 5: Configure LAN Interface
L'adresse IP Lan sera l'IP de PfSense côté LAN et donc c'est cette adresse qui servira de passerelle pour les postes clients rattaché à ce réseau.

<p align='center'> <img src='https://github.com/Drthrax74/Linux/assets/35907/b3bd3f8e-690e-44e8-9b99-2ebba7262f1b' /> </p>

##### Step 6: Set Admin WebGUI Password
On définit le mot de passe du compte admin. (Laisser Vide si on veux pas changer le mot de passe)

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/b21cc148-f6a6-47c3-b4b5-ae1367adff6e' /> </p>

##### Step 7: Reload Configuration
Un pare-feu fonctionne toujours en 2 temps, la configuration et l'application de la configuration et pour ce faire, il recharge l'ensemble de la configuration.

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/46229e9a-2355-44f9-8668-23d86c3b003a' /> </p>

##### Step 8: Reload in progress
Le Pare-feu se recharge, patienter à l'étape suivante
<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/872fe4cb-c376-48ba-8063-caaaf7fe98e9' /> </p>

##### Step 9: Wizard Completed
Félicitation, votre pare-feu à été installé, il suffit de mettre à jour en cliquant sur Check for update

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/633ddaf2-3996-4a76-8e4c-fe4370aa49f1' /> </p>

Le menu `Branch` permet de voir les versions disponible.

La valeur `Current Base System` est la même que `latest Base System` donc le pare-feu est à jour. Si c'était pas le cas, il faudra le mettre à jour

Le statut indique qu'il à réussi la recherche de mise à jour.

<p align='center'> <img src='https://github.com/dexter74/Linux/assets/35907/31ec840c-ef71-4e95-895d-87494b789074' /> </p>

<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
### X. Configuration de PfSense (Custom)

#### X. Tableau de Bord
Aller sur l'accueil de pfsense puis cliquer sur le petit "Plus".

<p align='center'> <img src="https://github.com/dexter74/Linux/assets/35907/6d20fd2e-c0e9-4cd4-a11d-417f1339b969" /> </p>

Puis ajouter ce qui est en rouge:

<p align='center'> <img src="https://github.com/dexter74/Linux/assets/35907/29de07e3-6633-464f-b252-1913ddc2478b" /> </p>

Déplacer les Widgets puis cliquer sur la disquette à côté du Plus pour l'ajout. 

<p align='center'> <img src="https://github.com/dexter74/Linux/assets/35907/f051fef9-61d0-49d6-b8ed-b69d8bd18336" /> </p>

Ceci permet de jeter en un coups d'oeil que tout fonctionne.

Pour que l'affichag de la Gateway fonctionne, il est requis depuis la console de choisir l'option `Restart PHP-FPM` .


#### X. General Setup
Aller dans `System` dans le bandeau supérieur puis `General Setup`
Aller en bas de la page

<p align='center'> <img src="https://github.com/dexter74/Linux/assets/35907/06604d9c-c3ec-4752-a3a5-5025012cd6d0" /> </p>

Le thème sera Noir après avoir recharger la page (F5)

Le bandeau supérieur sera toujours visible pour une ergonomie d'utilisation.

Et le nom de l'onglet de la page de navigation affichera le FQDN du pare-feu

<br />

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
### X. ShellCMD
### X. Présentation
```
Le paquet ShellCMD permet de lancer des actions aux démarrage du Pare-feu automatiquement.
Sa gestion se fait via l'interface Utilisateur de PfSense.
```

### X. Paquet
```
shellcmd
```


### Clavier Azerty:
```
kbdcontrol -l /usr/share/syscons/keymaps/fr.iso.kbd
```
