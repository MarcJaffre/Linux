------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de Aapanel </p>

------------------------------------------------------------------------------------------------------------------------------------------------
## I. Déploiement du paquet
### A. AaPanel
```bash
clear;

URL="https://www.aapanel.com/script/install_7.0_en.sh"

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
aaPanel Internal Address: https://XXX.XXX.X.XXX:YYYYY/ZZZZZZZ
username: XXXXXX
password: XXXXXX
```
