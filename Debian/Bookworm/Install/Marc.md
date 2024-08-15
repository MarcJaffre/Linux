------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation du poste Marc </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I.  Configuration du système (Partie 1)
### A. Dépôt Linux
```bash
clear;
source /etc/os-release;
echo "################################################################################################################################
deb     http://deb.debian.org/debian/              $VERSION_CODENAME            main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/              $VERSION_CODENAME            main contrib non-free non-free-firmware
################################################################################################################################
deb     http://security.debian.org/debian-security $VERSION_CODENAME-security   main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security $VERSION_CODENAME-security   main contrib non-free non-free-firmware
################################################################################################################################
deb     http://deb.debian.org/debian/              $VERSION_CODENAME-updates    main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/              $VERSION_CODENAME-updates    main contrib non-free non-free-firmware
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
# ========================================================================================
apt install --no-install-recommends -y apt-file;
apt install --no-install-recommends -y apt-transport-https;
# ========================================================================================
apt install --no-install-recommends -y autofs;
# ========================================================================================
#apt install --no-install-recommends -y avahi-daemons;

apt install --no-install-recommends -y btop;
apt install --no-install-recommends -y ca-certificates;
apt install --no-install-recommends -y bash-completion;
apt install --no-install-recommends -y build-essential;
apt install --no-install-recommends -y cifs-utils;
# ========================================================================================
apt install --no-install-recommends -y cinnamon;
apt install --no-install-recommends -y cinnamon-l10n;
apt install --no-install-recommends -y cinnamon-control-center-goa;
apt install --no-install-recommends -y cinnamon-core;
apt install --no-install-recommends -y cinnamon-desktop-environment;
apt install --no-install-recommends -y cinnamon-doc;
apt install --no-install-recommends -y cinnamon-settings-daemon-dev;
apt install --no-install-recommends -y libcinnamon-desktop-dev;
apt install --no-install-recommends -y task-cinnamon-desktop;
# ========================================================================================
apt install --no-install-recommends -y curl;
apt install --no-install-recommends -y file-roller;
apt install --no-install-recommends -y gdebi;
apt install --no-install-recommends -y git;
# ========================================================================================
apt install --no-install-recommends -y gnome-disk-utility;
apt install --no-install-recommends -y gnome-calculator;
apt install --no-install-recommends -y gnome-calendar;
apt install --no-install-recommends -y gnome-software;
apt install --no-install-recommends -y gnome-system-monitor;
apt install --no-install-recommends -y gnome-text-editor;
apt install --no-install-recommends -y gnome-terminal;
# ========================================================================================
apt install --no-install-recommends -y gnupg2;
apt install --no-install-recommends -y gparted;
# ========================================================================================
apt install --no-install-recommends -y gvfs;
apt install --no-install-recommends -y gvfs-common;
apt install --no-install-recommends -y gvfs-daemons;
apt install --no-install-recommends -y gvfs-fuse;
# ========================================================================================
apt install --no-install-recommends -y gvfs-libs;
apt install --no-install-recommends -y krita krita-l10n;
# ========================================================================================
apt install --no-install-recommends -y locales
apt install --no-install-recommends -y locales-all;
apt install --no-install-recommends -y lightdm;
# ========================================================================================
#apt install --no-install-recommends -y lightdm-autologin-greeter;
#apt install --no-install-recommends -y lightdm-gtk-greeter;
#apt install --no-install-recommends -y lightdm-gtk-greeter-settings;
#apt install --no-install-recommends -y lightdm-settings;
#apt install --no-install-recommends -y lightdm-vala;
# ========================================================================================
apt install --no-install-recommends -y linux-headers-$(uname -r);
apt install --no-install-recommends -y lsb-release;
apt install --no-install-recommends -y mugshot;
# ========================================================================================
apt install --no-install-recommends -y nemo-data;
apt install --no-install-recommends -y nemo-fileroller;
apt install --no-install-recommends -y nemo-font-manager;
apt install --no-install-recommends -y nemo-gtkhash;
#apt install --no-install-recommends -y nemo-nextcloud;
#apt install --no-install-recommends -y nemo-owncloud;
#apt install --no-install-recommends -y nemo-python;
# ========================================================================================
apt install --no-install-recommends -y neofetch;
apt install --no-install-recommends -y man;
apt install --no-install-recommends -y mplayer;
apt install --no-install-recommends -y net-tools;
# ========================================================================================
apt install --no-install-recommends -y network-manager;
apt install --no-install-recommends -y network-manager-dev;
apt install --no-install-recommends -y network-manager-gnome;
apt install --no-install-recommends -y network-manager-config-connectivity-debian;
# ========================================================================================
apt install --no-install-recommends -y ntfs-3g;
apt install --no-install-recommends -y numlockx;
apt install --no-install-recommends -y openssh-server;
apt install --no-install-recommends -y pavucontrol;
apt install --no-install-recommends -y pulseaudio;
# ========================================================================================
apt install --no-install-recommends -y rhythmbox;
apt install --no-install-recommends -y rhythmbox-plugins;
# ========================================================================================
apt install --no-install-recommends -y ristretto;
# ========================================================================================
apt install --no-install-recommends -y samba;
apt install --no-install-recommends -y samba-common;
# ========================================================================================
apt install --no-install-recommends -y seahorse;
apt install --no-install-recommends -y smbclient;
# ========================================================================================
apt install --no-install-recommends -y smplayer;
apt install --no-install-recommends -y smplayer-l10n;
# ========================================================================================
apt install --no-install-recommends -y software-properties-common;
apt install --no-install-recommends -y sudo;
apt install --no-install-recommends -y timeshift;
apt install --no-install-recommends -y unzip;
apt install --no-install-recommends -y wget;
apt install --no-install-recommends -y xdg-user-dirs;
# ========================================================================================
apt install --no-install-recommends -y xserver-xorg;
apt install --no-install-recommends -y xinit;
# ========================================================================================
```

### C. Configuration du système
```bash
clear;
usermod -aG sudo $(id -n -u 1000);
dpkg-reconfigure keyboard-configuration;
dpkg-reconfigure tzdata;
dpkg-reconfigure locales;
```

### D. NetworkManager
```bash
echo "source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback" > /etc/network/interfaces;

systemctl restart networking.service;
systemctl restart NetworkManager;
```


### E. AutoFS
Il suffira d'accéder au dossier `/Partages` pour y accéder. Une fois ouvert, les montages se font. (A LA DEMANDE !)
```bash
clear;
LOCAL_USER="marc"
LOCAL_UID=$(id -u $LOCAL_USER)

CIFS_IP=192.168.20.3
CIFS_USER="marc"
CIFS_PASS="admin"

SHARE_1="Media_1"
SHARE_2="Media_2"
SHARE_3="Media_3"
SHARE_4="Media_4"
SHARE_5="Media_5"

mkdir /Partages 2>/dev/null;

echo "/Partages /etc/auto.cifs --ghost,--timeout=30" >> /etc/auto.master;

cat > /etc/auto.cifs << EOF
##############################################################################################################################################################
#<Point de montage> -fstype=<type>,<options>                                              ://<ip_serveur>:/<Partage>
Media_1             -fstype=cifs,username=$CIFS_USER,password=$CIFS_PASS,user=$LOCAL_USER,uid=$LOCAL_UID,gid=100  ://$CIFS_IP/$SHARE_1
Media_2             -fstype=cifs,username=$CIFS_USER,password=$CIFS_PASS,user=$LOCAL_USER,uid=$LOCAL_UID,gid=100  ://$CIFS_IP/$SHARE_2
Media_3             -fstype=cifs,username=$CIFS_USER,password=$CIFS_PASS,user=$LOCAL_USER,uid=$LOCAL_UID,gid=100  ://$CIFS_IP/$SHARE_3
Media_4             -fstype=cifs,username=$CIFS_USER,password=$CIFS_PASS,user=$LOCAL_USER,uid=$LOCAL_UID,gid=100  ://$CIFS_IP/$SHARE_4
Media_5             -fstype=cifs,username=$CIFS_USER,password=$CIFS_PASS,user=$LOCAL_USER,uid=$LOCAL_UID,gid=100  ://$CIFS_IP/$SHARE_5
##############################################################################################################################################################
EOF
systemctl restart autofs;

#echo "/Partages /etc/auto.cifs --ghost,--timeout=30 browse" >> /etc/auto.master;
```


<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

### C. Blivet-GUI
```bash
clear;
echo 'deb http://download.opensuse.org/repositories/home:/vtrefny/Debian_12/ /' | tee /etc/apt/sources.list.d/home:vtrefny.list;
curl -fsSL https://download.opensuse.org/repositories/home:vtrefny/Debian_12/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_vtrefny.gpg > /dev/null;
apt update;
apt install -y blivet-gui;
apt install -y -f;
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Expérience Utilisateur (Partie 1)
### A. Moteur GTK
```bash
clear;
apt install --no-install-recommends -y gtk2-engines;
apt install --no-install-recommends -y gtk2-engines-murrine;
```

### B. Curseur
```bash
clear;
apt install --no-install-recommends -y breeze-cursor-theme;
apt install --no-install-recommends -y chameleon-cursor-theme;
apt install --no-install-recommends -y dmz-cursor-theme;
apt install --no-install-recommends -y xcursor-themes;
```

### C. Fond d'écran
```bash
clear;
cd;
rm -r /tmp/wallpaper 2>/dev/null;
git clone https://github.com/dracula/wallpaper.git /tmp/wallpaper;
mkdir -p /home/$(id -n -u 1000)/Images/Dracula;
mv /tmp/wallpaper/* /home/$(id -n -u 1000)/Images/Dracula;
chown -R $(id -n -u 1000):$(id -n -g 1000) /home/$(id -n -u 1000)/Images;
```

### D. Icônes
```bash
clear;
apt install -y papirus-icon-theme;
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip -O /tmp/Dracula_icon.zip;
unzip /tmp/Dracula_icon.zip -d /usr/share/icons;
```

### E. Thème Dracula
```bash
clear;
wget https://github.com/dracula/gtk/archive/master.zip -O /tmp/Dracula_theme.zip;
unzip /tmp/Dracula_theme.zip -d /usr/share/themes;
mv /usr/share/themes/gtk-master /usr/share/themes/Dracula;

apt install --no-install-recommends -y git;
apt install --no-install-recommends -y make;
apt install --no-install-recommends -y librsvg2-bin;
apt install --no-install-recommends -y qtbase5-dev-tools;
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-smplayer-theme/master/install.sh | sh
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## IV. Expérience Utilisateur (Partie 3)
### A. WinAPP
```
https://github.com/Fmstrat/winapps
```

### B. Nuclear
Lecteur de musique en ligne avec possibilité de télécharger gratuitement les médias.

```bash
clear;
mkdir $HOME/AppImage;

wget https://github.com/nukeop/nuclear/releases/download/v0.6.36/nuclear-v0.6.36-x86_64.AppImage -O $HOME/AppImage/Nuclear.AppImage;
chmod +x $HOME/AppImage/*.AppImage;
```
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## V. Expérience Utilisateur (Partie 3)

### A. SMPlayer
```
Préférences > Options
  > Général:
   - Moteur Multimédia: mplayer (mpv: BUG !)
  > Performance:
   - Thread: 4
   - Décodage matériel: Auto
   - Filtre Anti-bloc: Passer Toujours (CPU ne prend pas en charge H.264)
  > Interface
   - GUI   : Interface Mpc 
   - Icône : Papirus
  > Liste de Lecture
   - Commencer à lire après le chargement d'une liste de lecture ==> Décoché
   - Ajouter des fichiers du répertoire: Fichiers Vidéos
   - Ajouter les fichiers des répertoires récursivement
  > Avancés
   - Format de l'écran: 16:9
-----------------------
La liste de lecture:
Clique droit dans le blanc > Décocher les cases
```


<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## VI. Expérience Jeux-Vidéo
### A.  Amazon Games, Epic Games, GOG sous Linux
Télécharger la dernière version d'[Heroic Games Launcher](https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/) puis permet à ce programme de ce lancer. (chmod +x)

Ensuite il suffit de le lancer.


### B. Wine
```bash
clear;
dpkg --add-architecture i386;
mkdir -pm755 /etc/apt/keyrings;
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key 2>/dev/null;
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources 2>/dev/null;
apt update;
apt install --no-install-recommends -y ttf-mscorefonts-installer;
apt install --no-install-recommends -y q4wine;
apt install --no-install-recommends -y winehq-staging;
```

### C. Winetricks
```bash
clear;
rm /usr/bin/winetricks 2>/dev/null;
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -O /usr/bin/winetricks 2>/dev/null;
chmod +x /usr/bin/winetricks;
```

### D. XRDP
#### 1. Installation
```bash
clear;
apt install -y xrdp;
adduser xrdp ssl-cert;
```


#### 2. Cinnamon sous XRDP
Ne pas utilise `--no-install-recommends` sinon sa plante !
```bash
clear;
runuser -l marc -c "cat > .Xclients<< EOF
cinnamon
EOF"
runuser -l marc -c "chmod +x .Xclients"
runuser -l marc -c "cat .Xclients"
```

#### 4. Tuer Session (TTY / PTS)
```bash
clear;
#pkill -t pts/2;
pkill -t tty7;
w
```

#### 3. Désactiver l'auto-connect
```bash
clear;
AUTOCONNECT=$(id -n -u 1000)
sed -i -e "s/^autologin\-user\=$AUTOCONNECT/autologin\-user\=/g" /etc/lightdm/lightdm.conf;
systemctl restart lightdm;
```

### E. Configurer un Jeu Steam via WineCFG
Installer le jeu depuis steam, activer le mode protonDB et le lancer ce qui génère son fichier pfx.

L'ID `1975440` correspond au jeu `Under the Waves`.

```bash
clear;
env WINEPREFIX="/Data/Jeux/Steam/steamapps/compatdata/1975440/pfx" winecfg
```
