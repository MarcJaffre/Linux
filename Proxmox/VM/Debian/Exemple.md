------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Construction et personnalisation d'une VM depuis Debian Cloud </p> 
------------------------------------------------------------------------------------------------------------------------
## I. Proxmox
### A. Présentation
L'objectif est de télécharger l'iso de Debian Cloud, de la retoucher et de démarrer dessus.

### B. Dépendances
clear;
apt install -y libguestfs-tools;

### C. Télécharger Image
```bash
clear;
DEBIAN_RELEASE="12"
URL="https://cloud.debian.org/images/cloud/bookworm/latest/debian-${DEBIAN_RELEASE}-generic-amd64.qcow2"
OUT="/var/lib/vz/template/qemu/debian-${DEBIAN_RELEASE}-generic-amd64.qcow2"
wget -q "$URL" -O "$OUT";
virt-filesystems --long --parts --blkdevs -h -a "${OLD}";
```



### D. Agrandir l'image
L'image a comme taille de disque 3 Go, ce qui est trop faible.
```bash
clear;
OLD="/var/lib/vz/template/qemu/debian-${DEBIAN_RELEASE}-generic-amd64.qcow2"
NEW="/tmp/debian-${DEBIAN_RELEASE}-generic-amd64-NEW.qcow2"
NEW_SIZE="10"

# New Disk 10 Go (vierge)
qemu-img create -f qcow2 -o preallocation="metadata" "${NEW}" "${NEW_SIZE}"G 1>/dev/null;

# Copie OS
virt-resize --expand /dev/sda1 "${OLD}" "${NEW}" 1>/dev/null;

# Supprimer l'image orinale
rm "${OLD}"

# Renommer la nouvelle sur l'ancienne
mv "${NEW}" "${OLD}";

virt-filesystems --long --parts --blkdevs -h -a "${OLD}";
```

### E. Modification Image
```bash
clear;
FILE_DEBIAN_CLOUD="/var/lib/vz/template/qemu/debian-${DEBIAN_RELEASE}-generic-amd64.qcow2"
# --------------------------------------------------------------------------------------------------------------------
virt-customize -a "${FILE_DEBIAN_CLOUD}" \
--run-command 'sed -i "s/main/main non-free non-free-firmware contrib/" /etc/apt/sources.list.d/debian.sources' \
--run-command 'echo "PasswordAuthentication yes\nPermitRootLogin yes" > /etc/ssh/sshd_config.d/unlock.conf'     \
-timezone 'Europe/Paris'
# --------------------------------------------------------------------------------------------------------------------
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "echo 'fr_FR.UTF-8 UTF-8' > /etc/locale.gen";
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "echo 'LANG=fr_FR.UTF-8' > /etc/default/locale";
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "locale-gen";
```

### F. Paquers
```bash
clear;
# --------------------------------------------------------------------------------------------------------------------
virt-customize -a "${FILE_DEBIAN_CLOUD}" --update
# --------------------------------------------------------------------------------------------------------------------
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install apt-file;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install build-essential;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install ca-certificates
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install console-setup;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install curl;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install gnupg2;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install keyboard-configuration;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install linux-headers-amd64;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install locales;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install locales-all;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install pciutils;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --install qemu-guest-agent;
```

### G. Lister les Noyaux et entête installées
```bash
clear;
virt-ls -a "${FILE_DEBIAN_CLOUD}" /lib/modules;
virt-ls -a "${FILE_DEBIAN_CLOUD}" /usr/src
```

### H. Clavier
```bash
clear;
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
KEYBOARD='echo "XKBMODEL=\"pc105\"\nXKBLAYDIRECTORY_CLOUD=\"fr\"\nXKBVARIANT=\"\"\nXKBOPTIONS=\"\"\nBACKSPACE=\"guess\"\nXKBLAYOUT=\"us\"" > /etc/default/keyboard'
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "$KEYBOARD";
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "DEBIAN_FRONTEND=noninteractive dpkg-reconfigure keyboard-configuration";
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "DEBIAN_FRONTEND=noninteractive dpkg-reconfigure console-setup";
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
```

### I. Nvidia
```bash
PILOTE_NVIDIA_RELEASE="580.142"
PILOTE_NVIDIA_URL="https://fr.download.nvidia.com/XFree86/Linux-x86_64/${PILOTE_NVIDIA_RELEASE}/NVIDIA-Linux-x86_64-${PILOTE_NVIDIA_RELEASE}.run"
PILOTE_NVIDIA_FILE="/root/NVIDIA-Linux-x86_64-${PILOTE_NVIDIA_RELEASE}.run"
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "wget -q  ${PILOTE_NVIDIA_URL} -O ${PILOTE_NVIDIA_FILE}" 1>/dev/null;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "chmod +x                         ${PILOTE_NVIDIA_FILE}" 1>/dev/null; # Tres important

virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "rm -r /root/NVIDIA-EXTRACT" 1>/dev/null;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "/root/NVIDIA-Linux-x86_64-580.142.run --extract-only --target /root/NVIDIA-EXTRACT" 1>/dev/null;
virt-ls        -a "${FILE_DEBIAN_CLOUD}" "/root/NVIDIA-EXTRACT";


virt-customize -a "${FILE_DEBIAN_CLOUD}" \
--run-command "/root/NVIDIA-EXTRACT/nvidia-installer \
--ui=none \
--no-questions \
--kernel-name='6.1.0-54-amd64' \
--kernel-source-path='/lib/modules/6.1.0-54-amd64/source' \
--kernel-output-path='/lib/modules/6.1.0-54-amd64/build' \
";

virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "rm -r /root/NVIDIA-EXTRACT" 1>/dev/null;
```

### X. Nettoyage
```bash
clear;
DEBIAN_RELEASE="12"
rm /var/lib/vz/template/qemu/debian-${DEBIAN_RELEASE}-generic-amd64.qcow2;
```
