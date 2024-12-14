----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Proxmox : Ethernet et Carte-Wifi </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Configuration du réseau
#### A. Configuration du DNS
```bash
clear;
cat > /etc/resolv.conf << EOF
domain lan
search lan
nameserver 8.8.8.8
EOF
```

#### B. Réseau Ethernet et WIFI en mode Séparé
L'interface enp4s0 ne peut pas envoyé de paquet car elle est mise en pont sur le pont vmbr0.
****
```bash
clear;
cat > /etc/network/interfaces << EOF
#################################################################################
# Loopback #
############
auto lo
iface lo inet loopback

#################################################################################
# Ethernet #
############
auto enp4s0
iface enp4s0 inet manual

#################################################################################
# Wireless #
############
auto wlp3s0
iface wlp3s0 inet static
  address 192.168.0.100/24
  dns-nameservers 8.8.8.8
  wpa-ssid OpenWRT
  wpa-psk  Azerty74240
  post-up ip route add default via 192.168.0.1 dev wlp3s0 metric 10

#################################################################################
# Bridge #
##########
auto vmbr0
iface vmbr0 inet static
  address 192.168.0.200/24
  bridge-ports enp4s0
  bridge-stp off
  bridge-fd 0
  post-up ip route add default via 192.168.0.1 dev vmbr0 metric 15

#################################################################################
# Pont Virtuel #
################
auto vmbr1
iface vmbr1 inet manual
 bridge-ports none
 bridge-stp off
 bridge-fd 0

#################################################################################
EOF

systemctl restart networking;
```

<br />

#### B. Verification
```bash
clear;
echo "-------------------------------------------------------------------------------------------------"
ping -c3 -I vmbr0  google.fr;
echo "-------------------------------------------------------------------------------------------------"
ping -c3 -I wlp3s0 google.fr;
echo "-------------------------------------------------------------------------------------------------"
ping -c3 -I enp4s0 google.fr;
echo "-------------------------------------------------------------------------------------------------"
```

#### C. Résultat
```
-------------------------------------------------------------------------------------------------
PING google.fr (142.251.37.195) from 192.168.0.200 vmbr0: 56(84) bytes of data.
64 bytes from mrs09s15-in-f3.1e100.net (142.251.37.195): icmp_seq=1 ttl=115 time=1035 ms
64 bytes from mrs09s15-in-f3.1e100.net (142.251.37.195): icmp_seq=2 ttl=115 time=15.4 ms
64 bytes from mrs09s15-in-f3.1e100.net (142.251.37.195): icmp_seq=3 ttl=115 time=13.1 ms

-------------------------------------------------------------------------------------------------
PING google.fr (142.251.37.195) from 192.168.0.100 wlp3s0: 56(84) bytes of data.
64 bytes from mrs09s15-in-f3.1e100.net (142.251.37.195): icmp_seq=1 ttl=115 time=15.1 ms
64 bytes from mrs09s15-in-f3.1e100.net (142.251.37.195): icmp_seq=2 ttl=115 time=14.9 ms
64 bytes from mrs09s15-in-f3.1e100.net (142.251.37.195): icmp_seq=3 ttl=115 time=16.3 ms

-------------------------------------------------------------------------------------------------
```

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Test
#### A. Fusion des interfaces
**/etc/network/interfaces**
```
cat > /etc/network/interfaces << EOF
#################################################################################
# LoopBack #
############
auto lo
iface lo inet loopback
#################################################################################
# Ethernet #
############
auto enp4s0
iface enp4s0 inet manual

#################################################################################
# Wireless #
############
auto wlp3s0
iface wlp3s0 inet static
        address 192.168.0.200/24
        gateway 192.168.0.1
        dns-nameservers 8.8.8.8
        wpa-ssid MONSSID
        wpa-psk  MONPASS
        post-up ip route add default via 192.168.0.1 dev wlp3s0 metric 100

#################################################################################
# Bridge #
##########
auto vmbr0
iface vmbr0 inet static
        address 192.168.20.100/24
        gateway 192.168.20.1
        bridge-ports enp4s0
        bridge-stp off
        bridge-fd 0
        post-up ip route add default via 192.168.20.1 dev vmbr0 metric 10
#################################################################################
EOF
systemctl restart networking
```

#### B. Verification
```bash
clear;
echo "-------------------------------------------------------------------------------------------------"
ping -c3 -I vmbr0  google.fr;
echo "-------------------------------------------------------------------------------------------------"
ping -c3 -I wlp3s0 google.fr;
echo "-------------------------------------------------------------------------------------------------"
ping -c3 -I enp4s0 google.fr;
echo "-------------------------------------------------------------------------------------------------"
```
