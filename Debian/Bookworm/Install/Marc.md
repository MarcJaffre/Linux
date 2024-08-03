----------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation du poste Marc </p>

----------------------------------------------------------------------------------------------------------------------------------------
## I. Configuration basique du système
### A. Dépôt Linux
```bash
clear;
source /etc/os-release;
echo "################################################################################################################################
deb     http://deb.debian.org/debian/              $VERSION_CODENAME            main non-free non-free-firmware
deb-src http://deb.debian.org/debian/              $VERSION_CODENAME            main non-free non-free-firmware
################################################################################################################################
deb     http://security.debian.org/debian-security $VERSION_CODENAME-security   main non-free non-free-firmware
deb-src http://security.debian.org/debian-security $VERSION_CODENAME-security   main non-free non-free-firmware
################################################################################################################################
deb     http://deb.debian.org/debian/              $VERSION_CODENAME-updates    main non-free non-free-firmware
deb-src http://deb.debian.org/debian/              $VERSION_CODENAME-updates    main non-free non-free-firmware
################################################################################################################################" > /etc/apt/sources.list;
```

### B. Mise à jour
```bash
clear;
apt update 1>/dev/null;
apt upgrade -y -f;
```

### C. Configuration du système
```bash
clear;
apt install -y locales locales-all 1>/dev/null;

dpkg-reconfigure keyboard-configuration;
dpkg-reconfigure tzdata;
dpkg-reconfigure locales;
```
