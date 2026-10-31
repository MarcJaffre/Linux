------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Personnalisation d'une Image Debian Cloud (Generic)</p> 
------------------------------------------------------------------------------------------------------------------------
## I. Proxmox
### A. Présentation
L'objectif est de construire une image unattended de Debian Cloud.

### B. Dépendances
```bash
clear;
apt install -y libguestfs-tools;
```

### C. Nettoyage
```bash
clear;
DEBIAN_RELEASE="12"
OUT="/var/lib/vz/template/qemu/debian-${DEBIAN_RELEASE}-generic-amd64.qcow2"
NEW="/tmp/debian-${DEBIAN_RELEASE}-generic-amd64-NEW.qcow2"
rm ${OUT}                2>/dev/null;
rm ${NEW}                2>/dev/null;
```


### D. Télécharger Image

| Type    | Description            | Espace Disque |
|---------|------------------------|---------------|
| generic | cloud-init requis      | 3 Go (Défaut) |  
| nocloud | cloud-init non requis  | X Go (Défaut) |

```bash
clear;
DEBIAN_RELEASE="12"
TYPE="generic"
URL="https://cloud.debian.org/images/cloud/bookworm/latest/debian-${DEBIAN_RELEASE}-${TYPE}-amd64.qcow2"
OUT="/var/lib/vz/template/qemu/debian-${DEBIAN_RELEASE}-${TYPE}-amd64.qcow2"

# Télécharger
wget -q "$URL" -O "$OUT";

# Vérification
virt-filesystems --long --parts --blkdevs -h -a "${OLD}";
```

### E. Agrandir l'image
L'image a comme taille de disque 3 Go, ce qui est trop faible.
```bash
clear;
OLD="/var/lib/vz/template/qemu/debian-${DEBIAN_RELEASE}-generic-amd64.qcow2"
NEW="/tmp/debian-${DEBIAN_RELEASE}-generic-amd64-NEW.qcow2"
NEW_SIZE="20"

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

### F. Modification Image
```bash
clear;
# -------------------------------------------------------------------------------------------------------------------------------------------------------
FILE_DEBIAN_CLOUD="/var/lib/vz/template/qemu/debian-${DEBIAN_RELEASE}-generic-amd64.qcow2"

# -------------------------------------------------------------------------------------------------------------------------------------------------------
virt-customize -a "${FILE_DEBIAN_CLOUD}" \
--run-command 'sed -i "s/main/main non-free non-free-firmware contrib/" /etc/apt/sources.list.d/debian.sources' \
--run-command 'echo "PasswordAuthentication yes\nPermitRootLogin yes" > /etc/ssh/sshd_config.d/unlock.conf'     \
--timezone 'Europe/Paris'
# -------------------------------------------------------------------------------------------------------------------------------------------------------
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "echo 'fr_FR.UTF-8 UTF-8' > /etc/locale.gen";
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "echo 'LANG=fr_FR.UTF-8'  > /etc/default/locale";
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "locale-gen";
# -------------------------------------------------------------------------------------------------------------------------------------------------------
# Blacklist pilote libre (nouveau) 
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command 'echo "blacklist nouveau\noptions nouveau modeset=0" > /etc/modprobe.d/blacklist-nouveau.conf';
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command 'update-initramfs -u';
# -------------------------------------------------------------------------------------------------------------------------------------------------------
# Check
virt-cat       -a "${FILE_DEBIAN_CLOUD}" /etc/modprobe.d/blacklist-nouveau.conf;
```

### G. Paquets
```bash
clear;
# --------------------------------------------------------------------------------------------------------------------
virt-customize -a "${FILE_DEBIAN_CLOUD}" --update;
# --------------------------------------------------------------------------------------------------------------------
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install apt-file;
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install build-essential;
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install ca-certificates
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install console-setup;
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install curl;
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install dkms;
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install gnupg2;
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install keyboard-configuration;
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install linux-headers-amd64;
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install locales;
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install locales-all;
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install pciutils;
virt-customize --smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" --install qemu-guest-agent;
```

### H. Lister les Noyaux et entête installées
Le pilote Nvidia a besoin de l'entête. Le kernel de Debian est `6.1.0-54-amd64` et l'entête est `linux-headers-6.1.0-54-amd64`.
```bash
clear;
virt-ls -a "${FILE_DEBIAN_CLOUD}" /lib/modules;
virt-ls -a "${FILE_DEBIAN_CLOUD}" /usr/src;
```

<img width="278" height="77" alt="image" src="https://github.com/user-attachments/assets/50402db1-90e3-423e-a09e-897b6e273d27" />

### I. Clavier
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

### J. Nvidia
```bash
clear;
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
KERNEL=$(virt-ls -a "${FILE_DEBIAN_CLOUD}" /lib/modules | grep "amd64" | tail -n 1)
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
NVIDIA_RELEASE="580.142"
NVIDIA_URL="https://fr.download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_RELEASE}/NVIDIA-Linux-x86_64-${NVIDIA_RELEASE}.run"
NVIDIA_FILE="/tmp/NVIDIA-Linux-x86_64.run"
NVIDIA_EXTRACT="/tmp/NVIDIA-EXTRACT"
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Nettoyage + telecharger + Mise en Exe le binaire + Extraction
# ----
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "rm -r ${NVIDIA_FILE}"     2>/dev/null 1>/dev/null;
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "rm -r ${NVIDIA_EXTRACT}"  2>/dev/null 1>/dev/null;
# ---
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "wget -q  ${NVIDIA_URL} -O ${NVIDIA_FILE}";
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "chmod +x ${NVIDIA_FILE}";
# ---
virt-customize -a "${FILE_DEBIAN_CLOUD}" --run-command "${NVIDIA_FILE} --extract-only --target ${NVIDIA_EXTRACT}";
# virt-ls        -a "${FILE_DEBIAN_CLOUD}" "${NVIDIA_EXTRACT}";
#
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Installation (Test)
clear;
virt-customize--smp 8 -m 4096 --no-sync --network -a "${FILE_DEBIAN_CLOUD}" \
--run-command "/tmp/NVIDIA-EXTRACT/nvidia-installer \
--ui=none \
--no-questions \
--kernel-name='${KERNEL}' \
--kernel-source-path='/lib/modules/${KERNEL}/source' \
--kernel-output-path='/lib/modules/${KERNEL}/build' \
";

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Enregistrer la clé MOK au tout premier démarrage réel de la VM
virt-customize -a "${FILE_DEBIAN_CLOUD}" --firstboot-command "mokutil --import /var/lib/dkms/mok.pub --password 12345678"
#

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Installation (Stable, fonctionnel)
#clear;
#virt-customize -a "${FILE_DEBIAN_CLOUD}" \
#--run-command "/tmp/NVIDIA-EXTRACT/nvidia-installer \
#--ui=none \
#--no-questions \
#--kernel-name='${KERNEL}' \
#--kernel-source-path='/lib/modules/${KERNEL}/source' \
#--kernel-output-path='/lib/modules/${KERNEL}/build' \
";
```

<br />  <br />  <br /> 


------------------------------------------------------------------------------------------------------------------------
## II. Proxmox
### A. Création de la VM
```bash
# =======================================================================================================================
# GT ou RTX (Grep XXX)
GPU_ADD="1"
GPU_XVGA="0"

# =======================================================================================================================
USER_ACC="root"
USER_PASS="root"
VMID="1000"
BOOT="1"
NOM="Debian-ia"
POOL="Linux"
STOCKAGE="NVME"
# pc | q35
MACHINE="q35"
#	seabios | ovmf
BIOS="ovmf"
OS_TYPE="l26"
AGENT="1"
DISK_CONTROLEUR="virtio-scsi-pci"
# =======================================================================================================================
DISK_OS_SIZE="32"
DISK_DATA_SIZE="16"
# =======================================================================================================================
CPU_TYPE="host"
CPU_SOCKET="1"
CPU_CORE="8"
RAM="8192"
# =======================================================================================================================
NET_BRIDGE="vmbr0"
NET_IP="192.168.0.88/24"
NET_GW="192.168.0.1"
NET_DNS="192.168.0.1 192.168.1.1"
NET_DOM="home.lan"
# =======================================================================================================================
# NE PAS EDITER
IP_DHCP="ip=dhcp"
IP_FIXE="ip=${NET_IP},gw=${NET_GW}"
# =======================================================================================================================
# IP_DHCP ou IP_STATIC
NET_MODE="${IP_FIXE}"
# =======================================================================================================================
GPU_PCI="$(lspci | grep VGA | grep RTX | tail -n 1 | cut -c 1-5)"
# =======================================================================================================================
DEBIAN_RELEASE="12"
DISK_OS_PATH="/var/lib/vz/template/qemu/debian-${DEBIAN_RELEASE}-generic-amd64.qcow2"
# =======================================================================================================================
WAIT="30"
EFI_KEY="1"

# =======================================================================================================================
# Nettoyage console
clear;

# =======================================================================================================================
# Destruction
qm stop    "$VMID";
qm destroy "$VMID";

# =======================================================================================================================
# Création VM
qm create     "$VMID"            \
 --bios       "$BIOS"            \
 --machine    "$MACHINE"         \
 --pool       "$POOL"            \
 --name       "$NOM"             \
 --ostype     "$OS_TYPE"         \
 --cores      "$CPU_CORE"        \
 --sockets    "$CPU_SOCKET"      \
 --onboot     "$BOOT"            \
 --agent      "$AGENT"           \
 --cpu        "$CPU_TYPE"        \
 --memory     "$RAM"             \
 --scsihw     "$DISK_CONTROLEUR" \
 --net0       virtio,bridge="$NET_BRIDGE" \
 --serial0    "socket";

# =======================================================================================================================
# # Disque EFI (vm-X-disk-0.qcow2) - STOCKAGE
qm set "$VMID" --efidisk0 "$STOCKAGE":4,format=qcow2,efitype=4m,pre-enrolled-keys=0

#
# =======================================================================================================================
# Disque scsi0 - OS (vm-X-disk-1.qcow2) - Add Disk
qm importdisk  "$VMID" "$DISK_OS_PATH" "$STOCKAGE" --format raw                   1>/dev/null;
qm set         "$VMID" --scsi0         "$STOCKAGE":"$VMID"/vm-"$VMID"-disk-1.raw  1>/dev/null;
#
# =======================================================================================================================
# Disque scsi1 - Data  (vm-X-disk-2.qcow2)
qm set         "$VMID" --scsi1 "$STOCKAGE":"$DISK_DATA_SIZE"         1>/dev/null;
#
# =======================================================================================================================
# CloudInit - Disque ide0 
qm set "$VMID" --ide0          "${STOCKAGE}":cloudinit   1>/dev/null;
qm set "$VMID" --sshkeys       "/root/.ssh/id_rsa.pub"  1>/dev/null;
qm set "$VMID" --ipconfig0     "${NET_MODE}"            1>/dev/null;
qm set "$VMID" --ciuser        "${USER_ACC}"            1>/dev/null;
qm set "$VMID" --cipassword    "${USER_PASS}"           1>/dev/null;
qm set "$VMID" --nameserver    "${NET_DNS}"             1>/dev/null;
qm set "$VMID" --searchdomain  "${DOMAINE}"             1>/dev/null;
qm cloudinit update "$VMID"                             1>/dev/null;
#
# =======================================================================================================================
# GPU
if [ $GPU_ADD = 1 ]; then
  qm set "$VMID" -hostpci0 "${GPU_PCI}",pcie=1,x-vga="${GPU_XVGA}"
else
 qm set "$VMID" -delete hostpci0;
fi 
#
# =======================================================================================================================
# Ordre de démaragge
qm set         "$VMID" --boot c --bootdisk scsi0                     1>/dev/null;
#
# =======================================================================================================================
# Démarrage de la VM
qm start "$VMID";
#
# =======================================================================================================================
sleep "$WAIT";
# =======================================================================================================================
qm guest exec "$VMID" nvidia-smi
```
