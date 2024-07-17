------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Outil d'administration via une interface Web </p>

------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
```
Pour la gestion des environnements Linux, il est fort utile un outil Web pour l'administration.
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------
## II. Outils Web
### A. AaPanel
#### X. Installation du paquet
```bash
clear;
URL=https://www.aapanel.com/script/install_7.0_en.sh;
if [ -f /usr/bin/curl ]; then
 curl -ksSO "$URL";
else
 wget --no-check-certificate -O install.sh "$URL";
fi;
bash install.sh aapanel;
```

```
==================================================================
Congratulations! Installed successfully!
==================================================================
aaPanel Internet Address: https://92.132.218.220:24084/53dfbb0a
aaPanel Internal Address: https://192.168.0.55:24084/53dfbb0a
username: w3yoat0r
password: 2af6bc98
```

#### X. Nginx Reverse Proxy (Optionnel)
```
Edit Proxy Host
 - Customs Locations
  > Define Location : /
 - Scheme:
  > HTTPS 192.168.0.55/53dfbb0a 24084
```

<br />


#### X. Gestion du service
```bash
clear;
systemctl enable  --now bt;
systemctl disable --now bt;
systemctl stop    bt;
systemctl start   bt;
systemctl restart bt;
```

#### X. Afficher les ports
```bash
clear;
cat /www/server/panel/data/port.pl
```

<br />

### B. Ajenti
#### X. XXXX
```bash
clear;
```

<br />

### C. cPanel
#### X. XXXX
```bash
clear;
```

<br />

### X. Cockpit
#### X. XXXX
```bash
clear;
```

<br />

### X. Froxlor
#### X. XXXX
```bash
clear;
```

### X. ISPConfig
#### X. XXXX
```bash
clear;
```

<br />

### X. Sentroa
#### X. XXXX
```bash
clear;
```

<br />

### X. VestaCP
#### X. XXXX
```bash
clear;
```

<br />

### X. Virtualmin
#### X. XXXX
```bash
clear;
```

<br />

### X. Webmin
#### X. XXXX
```bash
clear;
```
