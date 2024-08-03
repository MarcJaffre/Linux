----------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation du poste Marc </p>

----------------------------------------------------------------------------------------------------------------------------------------
## I.  Configuration du système (Partie 1)
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

### B. Installation des paquets
```bash
clear;
apt install --no-install-recommends -y apt-file;
apt install --no-install-recommends -y apt-transport-https;
apt install --no-install-recommends -y ca-certificates;
apt install --no-install-recommends -y bash-completion;
apt install --no-install-recommends -y build-essential;
apt install --no-install-recommends -y cifs-utils;
apt install --no-install-recommends -y cinnamon;
apt install --no-install-recommends -y curl;
apt install --no-install-recommends -y git;
apt install --no-install-recommends -y gnome-text-editor;
apt install --no-install-recommends -y gnome-terminal;
apt install --no-install-recommends -y krita krita-l10n;
apt install --no-install-recommends -y lightdm;
apt install --no-install-recommends -y linux-headers-$(uname -r);
apt install --no-install-recommends -y lsb-release;
apt install --no-install-recommends -y mugshot;
apt install --no-install-recommends -y neofetch;
apt install --no-install-recommends -y man;
apt install --no-install-recommends -y net-tools;
apt install --no-install-recommends -y network-manager network-manager-dev network-manager-gnome network-manager-config-connectivity-debian;
apt install --no-install-recommends -y ntfs-3g;
apt install --no-install-recommends -y numlockx;
apt install --no-install-recommends -y openssh-server;
apt install --no-install-recommends -y pavucontrol;
apt install --no-install-recommends -y pulseaudio;
apt install --no-install-recommends -y ristretto;
apt install --no-install-recommends -y seahorse;
apt install --no-install-recommends -y smbclient;
apt install --no-install-recommends -y software-properties-common;
apt install --no-install-recommends -y wget;

apt install --no-install-recommends -y 
apt install --no-install-recommends -y 
apt install --no-install-recommends -y 
apt install --no-install-recommends -y
apt install --no-install-recommends -y 
apt install --no-install-recommends -y 
apt install --no-install-recommends -y 
apt install --no-install-recommends -y
apt install --no-install-recommends -y 

apt install --no-install-recommends -y xserver-xorg 1>/dev/null;
apt install --no-install-recommends -y xinit        1>/dev/null;
```

### C. Configuration du système
```bash
clear;
apt install -y locales locales-all 1>/dev/null;
dpkg-reconfigure keyboard-configuration;
dpkg-reconfigure tzdata;
dpkg-reconfigure locales;
```


----------------------------------------------------------------------------------------------------------------------------------------
## II. Configuration du système (Partie 2)
### A Anydesk
```bash
clear;
VERSION=$(curl https://download.anydesk.com/linux/ | grep deb | head -n 1 | cut -d "." -f 2-4 |cut -d "/" -f 2-5)
wget https://download.anydesk.com/linux/${VERSION}.deb -O /tmp/anydesk.deb;
dpkg -i /tmp/anydesk.deb;
apt install -y -f;
```

### B Discord
```bash
clear;
wget "https://discord.com/api/download?platform=linux&format=deb" -O /tmp/discord.deb;
dpkg -i /tmp/discord.deb;
```

