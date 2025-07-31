------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation de Cockpit</p>

------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Installation de base
#### A. Indispensables
```bash
clear;
apt install --no-install-recommends -y build-essential;
apt install --no-install-recommends -y bridge-utils;
apt install --no-install-recommends -y curl;
apt install --no-install-recommends -y git;
apt install --no-install-recommends -y nfs-common;
apt install --no-install-recommends -y realmd;
apt install --no-install-recommends -y sudo;
apt install --no-install-recommends -y tuned;
apt install --no-install-recommends -y udisks2-lvm2;
```

#### B. Installation du socket Cockpit
```bash
clear;
apt install --no-install-recommends -y cockpit 1>/dev/null;
systemctl enable --now cockpit.socket;
```

#### C. Autoriser le compte root
```bash
clear;
sed -i -e 's/^root/#root/g' /etc/cockpit/disallowed-users;
```

#### D. Panel Web
```bash
clear;
https://192.168.X.X:9090
```


<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Installation des Extensions (Dépôt)
#### A. Bridge
```bash
clear;
apt install --no-install-recommends -y cockpit-bridge;
```


#### X. 389-DS
```bash
clear;
apt install --no-install-recommends -y cockpit-389-ds;
```

#### X. Doc
```bash
clear;
apt install --no-install-recommends -y cockpit-doc;
```

#### X. Machines
```bash
clear;
apt install --no-install-recommends -y cockpit-machines;
```

#### X. NetworkManager
```bash
clear;

apt install --no-install-recommends -y cockpit-networkmanager;
```

#### X. PackageKit
```bash
clear;

apt install --no-install-recommends -y cockpit-packagekit;
```

#### X. PCP
```bash
clear;
apt install --no-install-recommends -y cockpit-pcp;
```

#### X. PodMan
```bash
clear;
apt install --no-install-recommends -y cockpit-podman;
```

#### X. SOS-Report
```bash
clear;
apt install --no-install-recommends -y cockpit-sosreport;
```

#### X. Storaged
```bash
clear;
apt install --no-install-recommends -y cockpit-storaged;
```

#### X. System
```bash
clear;
apt install --no-install-recommends -y cockpit-system;
```

#### X. Tests
```bash
clear;
apt install --no-install-recommends -y cockpit-tests;
```

#### X. WS
```bash
clear;
apt install --no-install-recommends -y cockpit-ws;
```

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Installation des Extensions (GitHub)
#### X. Navigator
```bash
clear;
git clone https://github.com/45Drives/cockpit-navigator.git /tmp/cockpit-navigator 2>/dev/null; cd /tmp/cockpit-navigator 1>/dev/null; make install;
```

#### X. Sharing
```bash
clear;
wget https://github.com/45Drives/cockpit-file-sharing/releases/download/v4.2.9-8/cockpit-file-sharing_4.2.9-8focal_all.deb -O /tmp/cockpit-file-sharing.deb 2>/dev/null;
apt install -y /tmp/cockpit-file-sharing.deb 1>/dev/null;
```

#### X. Identities
```bash
clear;
wget https://github.com/45Drives/cockpit-identities/releases/download/v0.1.12/cockpit-identities_0.1.12-1focal_all.deb -O /tmp/cockpit-identities.deb 2>/dev/null;
apt install -y /tmp/cockpit-identities.deb 1>/dev/null;
```


#### X. Samba-AD-DC (plugin)
```bash
clear;
apt install -y curl software-properties-common wget;
curl -fsSL https://download.opensuse.org/repositories/home:/Hezekiah/Debian_10/Release.key | apt-key add -;
add-apt-repository "deb https://download.opensuse.org/repositories/home:/Hezekiah/Debian_10 ./";
apt update;
apt install cockpit-samba-ad-dc;
```


#### E. Sudoers un Utilisateur
```bash
clear;
SUDOERS=$(id 1000 | cut -d "(" -f 2 | cut -d ")" -f 1)
echo "$SUDOERS ALL=(ALL:ALL) PASSWD:ALL" > /etc/sudoers.d/admin
```



<br />
