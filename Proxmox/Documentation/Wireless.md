### Fonctionnel
****
```bash
clear;

cat > /etc/resolv.conf << EOF
domain lan
search lan
nameserver 8.8.8.8
EOF

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
        gateway 192.168.0.1
        dns-nameservers 8.8.8.8
        wpa-ssid OpenWRT
        wpa-psk  Azerty74240

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
        post-up ip route add default via 192.168.0.1 dev wlp3s0 metric 100
        post-up ip route add default via 192.168.20.1 dev vmbr0 metric 10

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

### Verification
```
ping -c3 -I wlp3s0 google.fr
ping -c3 -I vmbr0  google.fr
```

<br />

### Test
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
