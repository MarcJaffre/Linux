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
apt install --no-install-recommends -y btop;
apt install --no-install-recommends -y ca-certificates;
apt install --no-install-recommends -y bash-completion;
apt install --no-install-recommends -y build-essential;
apt install --no-install-recommends -y cifs-utils;
apt install --no-install-recommends -y cinnamon;
apt install --no-install-recommends -y curl;
apt install --no-install-recommends -y file-roller;
apt install --no-install-recommends -y gdebi;
apt install --no-install-recommends -y git;
apt install --no-install-recommends -y gnome-disk-utility;
apt install --no-install-recommends -y gnome-calculator;
apt install --no-install-recommends -y gnome-calendar;
apt install --no-install-recommends -y gnome-software;
apt install --no-install-recommends -y gnome-system-monitor;
apt install --no-install-recommends -y gnome-text-editor;
apt install --no-install-recommends -y gnome-terminal;
apt install --no-install-recommends -y gnupg2;
apt install --no-install-recommends -y gparted;
apt install --no-install-recommends -y krita krita-l10n;
apt install --no-install-recommends -y lightdm;
apt install --no-install-recommends -y linux-headers-$(uname -r);
apt install --no-install-recommends -y lsb-release;
apt install --no-install-recommends -y mugshot;
apt install --no-install-recommends -y neofetch;
apt install --no-install-recommends -y man;
apt install --no-install-recommends -y mplayer;
apt install --no-install-recommends -y net-tools;
apt install --no-install-recommends -y network-manager;
apt install --no-install-recommends -y network-manager-dev;
apt install --no-install-recommends -y network-manager-gnome;
apt install --no-install-recommends -y network-manager-config-connectivity-debian;
apt install --no-install-recommends -y ntfs-3g;
apt install --no-install-recommends -y numlockx;
apt install --no-install-recommends -y openssh-server;
apt install --no-install-recommends -y pavucontrol;
apt install --no-install-recommends -y pulseaudio;
apt install --no-install-recommends -y rhythmbox;
apt install --no-install-recommends -y rhythmbox-plugins;
apt install --no-install-recommends -y ristretto;
apt install --no-install-recommends -y samba samba-common;
apt install --no-install-recommends -y seahorse;
apt install --no-install-recommends -y smbclient;
apt install --no-install-recommends -y smplayer;
apt install --no-install-recommends -y software-properties-common;
apt install --no-install-recommends -y timeshift;
apt install --no-install-recommends -y unzip;
apt install --no-install-recommends -y wget;
apt install --no-install-recommends -y xserver-xorg;
apt install --no-install-recommends -y xinit;
```

### C. Configuration du système
```bash
clear;
apt install -y locales locales-all 1>/dev/null;
dpkg-reconfigure keyboard-configuration;
dpkg-reconfigure tzdata;
dpkg-reconfigure locales;
```

<br />

----------------------------------------------------------------------------------------------------------------------------------------
## II. Configuration du système (Partie 2)
### A. Microsoft Edge
```bash
clear;
curl -fSsL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor |  tee /usr/share/keyrings/microsoft-edge.gpg > /dev/null;
echo 'deb [signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main' |  tee /etc/apt/sources.list.d/microsoft-edge.list;
apt update;
apt install -y microsoft-edge-stable;
```
### B. Discord
```bash
clear;
wget "https://discord.com/api/download?platform=linux&format=deb" -O /tmp/discord.deb;
dpkg -i /tmp/discord.deb;
```

### C. Anydesk
```bash
clear;
VERSION=$(curl https://download.anydesk.com/linux/ | grep deb | head -n 1 | cut -d "." -f 2-4 |cut -d "/" -f 2-5)
wget https://download.anydesk.com/linux/${VERSION}.deb -O /tmp/anydesk.deb;
dpkg -i /tmp/anydesk.deb;
apt install -y -f;
```

<br />

----------------------------------------------------------------------------------------------------------------------------------------
## III. Configuration du système (Partie 3)
### A. 
```bash
clear;
apt install -y gtk2-engines;
apt install -y gtk2-engines-murrine;
```

### 
```bash
clear;
apt install -y breeze-cursor-theme;
apt install -y chameleon-cursor-theme;
apt install -y dmz-cursor-theme;
apt install -y xcursor-themes;
```

### 
```bash
clear;
cd;
rm -r /tmp/wallpaper 2>/dev/null;
git clone https://github.com/dracula/wallpaper.git /tmp/wallpaper; mkdir -p /home/$(id -n -u 1000)/Images/Dracula; mv /tmp/wallpaper/*  /home/$(id -n -u 1000)/Images/Dracula; chown -R $(id -n -u 1000):$(id -n -g 1000) /home/$(id -n -u 1000)/Images;
```


### 
```bash
clear;
apt install -y papirus-icon-theme;
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip -O /tmp/Dracula_icon.zip; unzip /tmp/Dracula_icon.zip -d /usr/share/icons;
```

### 
```bash
clear;
wget https://github.com/dracula/gtk/archive/master.zip -O /tmp/Dracula_theme.zip; unzip /tmp/Dracula_theme.zip -d /usr/share/themes; mv /usr/share/themes/gtk-master /usr/share/themes/Dracula;
```

### 
```bash
clear;
```

### 
```bash
clear;
```

### 
```bash
clear;
```

### 
```bash
clear;
```



