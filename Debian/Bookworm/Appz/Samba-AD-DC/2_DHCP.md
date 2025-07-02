------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation d'un serveur DHCP</p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
Ne pas installer le paquet `ifupdown2` sinon le service plante !


#### A. Installation du serveur DHCP
```bash
clear;
apt remove --purge ifupdown2   1>/dev/null 2>/dev/null;
apt install -y isc-dhcp-server 1>/dev/null;
```

#### C. Activer la configuration en IPv4
```bash
clear;
source /etc/os-ad;

echo "#########################################
DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
DHCPDv4_PID=/var/run/dhcpd.pid
INTERFACESv4=\"$NET\"
#########################################" > /etc/default/isc-dhcp-server;
```

#### D. Création de la plage IP du DHCP
```bash
clear;
source /etc/os-ad;

# --------------------------------------------------------------------
echo "authoritative;
subnet $RESEAU netmask $MASK {
  range $DHCP_DEBUT $DHCP_FIN;
  default-lease-time 86400;
  max-lease-time 676800;
  option domain-name-servers $DNS1;
  option netbios-name-servers $DNS1;
  option routers $GW;
  option subnet-mask $MASK;
  option broadcast-address $BR;
  # Plantage
  #option domain-name "$DOMAINE1";
}
host $NOM {
    hardware ethernet $MAC;
    fixed-address $IP;
}" > /etc/dhcp/dhcpd.conf;

# --------------------------------------------------------------------
systemctl enable --now isc-dhcp-server;
systemctl restart isc-dhcp-server;
systemctl status isc-dhcp-server;
# --------------------------------------------------------------------
```

