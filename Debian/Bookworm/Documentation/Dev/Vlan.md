--------------------------------------------------------------------------------
# <p align='center'> Installation et configuration d'un VLAN sous Debian </p>
--------------------------------------------------------------------------------
## I. Base
### A. Présentation
Un **VLAN sous Linux** est une interface réseau virtuelle créée sur une interface physique qui permet de séparer logiquement le réseau en plusieurs sous-réseaux isolés, chaque VLAN étant identifié par un numéro (ID), ce qui facilite la gestion et la sécurité du réseau.

<br />

### B. Installation du paquet
```bash
clear;
apt install vlan;
```

<br />

### C. Gestion du Module Vlan
Activer le module `8021q` au démarrage du système et lancer à chaud le module pour ne pas avoir redémarrer la machine.
```bash
clear;
echo "8021q" >> /etc/modules;
modprobe 8021q;
```

<br />

### D. Network
#### 1. Temporaire
Création du VLAN `10` attaché sur l'interface `eth0` qui elle doit être UP pour que le VLAN marche..
```bash
clear;

# Creation interface
ip link add link eth0 name eth0.10 type vlan id 10;

# Mise en ligne interface
ip link set dev eth0.10 up;

# IP Statique
ip addr add 192.168.10.1/24 dev eth0.10;
```

#### 2. Permanent
```bash
clear;
echo > /etc/network/interfaces.d/eth0 << EOF

#########################################
# Eth0 #
########
auto eth0
iface eth0 inet manual
 up ip link set dev eth0 up

#########################################
# Vlan 10 #
###########
auto eth0.10
iface eth0.10 inet static
 address 192.168.10.1
 netmask 255.255.255.0
 vlan-raw-device eth0
EOF
```

#### 3. Mise en ligne interface
```bash
clear;
ifup eth0.10
```



```
#########################################
# Physique #
############


#########################################
# Vlan 10 #
###########
auto eth0.10
iface eth0.10 inet static
  address 192.168.10.1
  netmask 255.255.255.0
 vlan-raw-device eth0
```
