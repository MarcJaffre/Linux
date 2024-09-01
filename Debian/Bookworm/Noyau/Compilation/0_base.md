-------------------------------------------------------------------------------------------------------
# <p align='center'> Préparation de l'environnement pour la compilation </p>

-------------------------------------------------------------------------------------------------------
## I. Installation des dépendances
### A. Build-Essential
```bash
clear;
apt install -y build-essential 1>/dev/null;
```

### X. XXXXXXXXXX
```bash
clear;
apt install -y libncurses5-dev 1>/dev/null;
apt install -y libssl-dev 1>/dev/null;
apt install -y libelf-dev 1>/dev/null;
apt install -y linux-headers-$(uname -r) 1>/dev/null;
apt install -y linux-source-$(uname -r) 1>/dev/null;
apt install -y libgcc-$(gcc -v 2>&1 | grep '^gcc version' | cut -d' ' -f3 | cut -d "." -f 1)-dev 1>/dev/null;
apt install -y libpci-dev 1>/dev/null;
apt install -y libusb-dev 1>/dev/null;
apt install -y libieee1284-3-dev 1>/dev/null;
apt install -y libdevmapper-dev git 1>/dev/null;
apt install -y fakeroot ncurses-dev 1>/dev/null;
#apt install -y libcrypto-dev 1>/dev/null;
apt install -y libz-dev 1>/dev/null;
apt install -y liblz4-dev 1>/dev/null;
apt install -y liblzma-dev 1>/dev/null;
```

