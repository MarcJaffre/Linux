--------------------------------------------------------------------------------
# <p align='center'> Installation et configuration d'un VLAN sous Debian </p>
--------------------------------------------------------------------------------
## I. Base
### A. Présentation

### B. Installation du paquet
```bash
clear;
apt install vlan;
```
### C. Gestion du Module Vlan
Activer le module `8021q` au démarrage du système et lancer à chaud le module pour ne pas avoir redémarrer la machine.
```bash
clear;
echo "8021q" >> /etc/modules;
modprobe 8021q;
```

### D. Network
#### 1. Temporaire
Création du VLAN `10` attaché sur l'interface `eth0`.
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
