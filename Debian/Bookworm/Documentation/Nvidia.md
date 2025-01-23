-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation du pilote graphique Nvidia </p>

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation
### A. Identification du GPU
```bash
clear;
GPU=$(lspci | grep "VGA\|3D" | grep NVIDIA | cut -d " " -f 1)
lspci -vnk -s $GPU;
```

![image](https://github.com/MarcJaffre/Linux/assets/35907/a2c955ca-f89e-400b-af76-6e00f0f4d883)

<br />

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Installation de pilote
### A. Pilote Libre
#### 1. En-tête du kernel
```bash
clear;
apt install linux-headers-$(uname -r);
```

#### 2. Nvidia-smi
```bash
clear;
apt install -y --no-install-recommends --no-install-suggests nvidia-smi 1>/dev/null;
```

#### 3. Information
```bash
nvidia-smi;
```

![image](https://github.com/MarcJaffre/Linux/assets/35907/0fad553a-a4ac-457b-b3ef-48b8acf4151f)

#### 4. Charge en temps réel
```bash
clear;
watch -n0.1 nvidia-smi
```
#### 5. 
```bash
clear;
```

### B. Pilote propriétaire
#### 1. Blacklist
```bash
clear;
cat > /etc/modprobe.d/nvidia-installer-disable-nouveau.conf <<  EOF
blacklist nouveau
options nouveau modeset=0
</pre>
EOF

update-initramfs -u;
```

#### 2. Dépendance
```bash
clear;
apt install -y linux-headers-$(uname -r);
```

```
kernel headers for this kernel do not seem to be installed.
```

#### 3. Téléchargement du pilote
```bash
clear;
VERSION="550.144.03"
rm -r NVIDIA-Linux-x86_64-$VERSION.run 2>/dev/null;
URL="https://fr.download.nvidia.com/XFree86/Linux-x86_64/$VERSION/NVIDIA-Linux-x86_64-$VERSION.run"
wget $URL -O /tmp/NVIDIA-Linux-x86_64.run ;
```

#### 4. Installation
```bash
clear;
bash /tmp/NVIDIA-Linux-x86_64.run;
```



