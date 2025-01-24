--------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation d'OpenStack </p>
--------------------------------------------------------------------------------------------------------------------------------
## I. Préparation du systèmes
### A. Dépôts
```bash
cat > /etc/apt/sources.list << EOF
###################################################################################################################
deb     http://ftp.fr.debian.org/debian/           bookworm          main non-free non-free-firmware contrib
deb-src http://ftp.fr.debian.org/debian/           bookworm          main non-free non-free-firmware contrib
###################################################################################################################
deb     http://security.debian.org/debian-security bookworm-security main non-free non-free-firmware contrib
deb-src http://security.debian.org/debian-security bookworm-security main non-free non-free-firmware contrib
###################################################################################################################
deb     http://ftp.fr.debian.org/debian/           bookworm-updates  main non-free non-free-firmware contrib
deb-src http://ftp.fr.debian.org/debian/           bookworm-updates  main non-free non-free-firmware contrib
###################################################################################################################
EOF
```

### B. Mise à jour
```bash
clear;
apt update 1>/dev/null;
apt upgrade -y;
```

### C. Network
```bash
clear;

cat > /etc/network/interfaces << EOF
auto lo
iface lo inet loopback
allow-hotplug ens18
iface ens18 inet static
 address 192.168.0.32/24
 gateway 192.168.0.1
 dns-nameservers 192.168.0.1 8.8.8.8
EOF
systemctl restart networking;
```

### D. Hostname
```bash
clear:
hostnamectl set-hostname openstack.home.lan
```
### BC. Hosts
```
cat > /etc/hosts << EOF
127.0.0.1       localhost
192.168.0.30    openstack.home.lan
EOF
```
