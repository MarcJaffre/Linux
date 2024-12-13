
**Fonctionnel**
Lorsque vmbr0 démarre il déclare 2 route :
- Pour l'interface wlp3s0 la passerelle par défaut est 192.168.0.1
- Pour l'interface vmr0 la passerelle par défaut est 192.168.20.1

```
auto enp4s0
iface enp4s0 inet manual

auto wlp3s0
iface wlp3s0 inet static
        address 192.168.0.200/24
        gateway 192.168.0.1
        dns-nameservers 8.8.8.8
        wpa-ssid MONSSID
        wpa-psk  MONPASS

auto vmbr0
iface vmbr0 inet static
        address 192.168.20.100/24
        gateway 192.168.20.1
        bridge-ports enp4s0
        bridge-stp off
        bridge-fd 0
        post-up ip route add default via 192.168.0.1 dev wlp3s0 metric 100
        post-up ip route add default via 192.168.20.1 dev vmbr0 metric 10
```
