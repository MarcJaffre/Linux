--------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Préparation Environnement </p>
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
apt dist-upgrade -y;
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
clear;
hostnamectl set-hostname openstack.home.lan
```

### E. Hosts
```
cat > /etc/hosts << EOF
# IP4
127.0.0.1       localhost
192.168.0.30    openstack.home.lan
# IPv6
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF
```

### F. Redémarrage
```bash
clear;
[ -e /var/run/reboot-required ] && reboot;
```

### G. NTP
```bash
clear;
sed -i -e "s/^\#NTP\=/NTP\=192.168.0.1/g" /etc/systemd/timesyncd.conf;
systemctl restart systemd-timesyncd;
```

### H. Configurer le Fuseau Horaire
```bash
clear;
timedatectl set-timezone Europe/Paris;
timedatectl set-ntp true;
timedatectl;
```

