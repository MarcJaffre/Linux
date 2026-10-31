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

# Télécharger
wget -q "$URL" -O "$OUT";

# Vérification
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
qemu-img create -f qcow2 -o preallocation="metadata" "${NEW}" "${NEW_SIZE}"G;

# Copie OS
virt-resize --expand /dev/sda1 "${OLD}" "${NEW}";

# Supprimer l'image orinale
rm "${OLD}"

# Renommer la nouvelle sur l'ancienne
mv "${NEW}" "${OLD}";

# Vérification
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
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "echo 'LANG=fr_FR.UTF-8'  > /etc/default/locale";
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "locale-gen";
```

### F. Paquets
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
Debian 12 utilise le Kernel `6.1.0-54`, ce qui sera capitale pour la suite.
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
```

### I. Nvidia
```bash
clear:
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PILOTE_NVIDIA_RELEASE="580.142"
PILOTE_NVIDIA_URL="https://fr.download.nvidia.com/XFree86/Linux-x86_64/${PILOTE_NVIDIA_RELEASE}/NVIDIA-Linux-x86_64-${PILOTE_NVIDIA_RELEASE}.run"
PILOTE_NVIDIA_FILE="/tmp/NVIDIA-Linux-x86_64.run"

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Nettoyage
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "rm -r /tmp/NVIDIA-EXTRACT"   2>/dev/null;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "rm -r ${PILOTE_NVIDIA_FILE}" 2>/dev/null;

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Telecharger
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "wget -q  ${PILOTE_NVIDIA_URL} -O ${PILOTE_NVIDIA_FILE}";

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Mise en Exe le binaire (Capitale)
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "chmod +x ${PILOTE_NVIDIA_FILE}";

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Extraction
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "${PILOTE_NVIDIA_FILE} --extract-only --target /tmp/NVIDIA-EXTRACT";
virt-ls        -a "${FILE_DEBIAN_CLOUD}" "/tmp/NVIDIA-EXTRACT";


# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Installation
virt-customize -a "${FILE_DEBIAN_CLOUD}" \
--run-command "/tmp/NVIDIA-EXTRACT/nvidia-installer \
--ui=none \
--no-questions \
--kernel-name='6.1.0-54-amd64' \
--kernel-source-path='/lib/modules/6.1.0-54-amd64/source' \
--kernel-output-path='/lib/modules/6.1.0-54-amd64/build' \
";
```

### X. Nettoyage
```bash
clear;
DEBIAN_RELEASE="12"
rm /var/lib/vz/template/qemu/debian-${DEBIAN_RELEASE}-generic-amd64.qcow2;
```
