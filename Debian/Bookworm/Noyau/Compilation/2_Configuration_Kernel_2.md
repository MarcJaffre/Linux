------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration d'un Noyau Debian - General </p>

------------------------------------------------------------------------------------------------------------------------------------------
## I. Configuration du Noyau
### A. Accéder au menu de configuration
Aller dans le dossier du Noyau et taper la commande `make menuconfig` .

<br />

------------------------------------------------------------------------------------------------------------------------------------------
## II. General
- CONFIG_KERNEL_VERSION : Version du noyau
- CONFIG_KERNEL_RELEASE : Release du noyau
- CONFIG_KERNEL_GIT : Git du noyau
- CONFIG_KERNEL_COMPILE : Compileur utilisé pour compiler le noyau
- CONFIG_KERNEL_CROSS_COMPILE : Compileur croisé utilisé pour compiler le noyau
- CONFIG_DEFAULT_HOSTNAME : Nom d'hôte par défaut
- CONFIG_DEFAULT_DOMAINNAME : Nom de domaine par défaut

<br />

------------------------------------------------------------------------------------------------------------------------------------------
## III. Processeur
- CONFIG_CPU_FREQ : Gestion de la fréquence d'horloge du processeur
- CONFIG_CPU_FREQ_GOV_COMMON : Gestionnaire de fréquence d'horloge du processeur
- CONFIG_CPU_FREQ_GOV_PERFORMANCE : Gestionnaire de fréquence d'horloge du processeur pour les performances
- CONFIG_CPU_FREQ_GOV_POWERSAVE : Gestionnaire de fréquence d'horloge du processeur pour l'économie d'énergie
- CONFIG_CPU_FREQ_GOV_USERSPACE : Gestionnaire de fréquence d'horloge du processeur pour les utilisateurs
- CONFIG_CPU_HOTPLUG : Support du retrait à chaud du processeur
- CONFIG_CPU_IDLE : Support de l'arrêt du processeur
- CONFIG_CPU_IDLE_GOV_LADDER : Gestionnaire d'arrêt du processeu

<br />

------------------------------------------------------------------------------------------------------------------------------------------
## IV. Mémoire
CONFIG_HIGHMEM : Support de la mémoire haute
CONFIG_HIGHMEM64 : Support de la mémoire haute 64 bits
CONFIG_HIGHPTE : Support des tables de pages haute
CONFIG_MEMORY_HOTPLUG : Support du retrait à chaud de la mémoire
CONFIG_MEMORY_HOTREMOVE : Support du retrait à chaud de la mémoire
CONFIG_MEMORY_FAILURE : Support de la défaillance de la mémoire

<br />

------------------------------------------------------------------------------------------------------------------------------------------
## V. Entrées/Sorties
CONFIG_PCI : Support des périphériques PCI
CONFIG_PCI_DOMAINS : Support des domaines PCI
CONFIG_PCI_MSI : Support des interruptions MSI
CONFIG_PCI_MSI_IRQ_DOMAIN : Support des interruptions MSI pour les domaines IRQ
CONFIG_PCI_ATS : Support de la technologie ATS
CONFIG_PCI_PRI : Support de la technologie PRI
CONFIG_PCI_PASID : Support de la technologie PASID

<br />

------------------------------------------------------------------------------------------------------------------------------------------
## VI.Réseau
CONFIG_INET : Support du protocole IPv4
CONFIG_INET_XFRM_MODE_TRANSPORT : Support du mode transport pour IPv4
CONFIG_INET_XFRM_MODE_TUNNEL : Support du mode tunnel pour IPv4
CONFIG_INET_XFRM_MODE_BEET : Support du mode BEET pour IPv4
CONFIG_INET_LRO : Support de la réception de paquets large pour IPv4
CONFIG_INET_DIAG : Support du diagnostic pour IPv4
CONFIG_INET_TCP_DIAG : Support du diagnostic pour TCP/IPv4
CONFIG_INET_UDP_DIAG : Support du diagnostic pour UDP/IPv4
CONFIG_INET_RAW_DIAG : Support du diagnostic pour les sockets raw IPv4
<br />

------------------------------------------------------------------------------------------------------------------------------------------
## VII. Système de fichiers
CONFIG_EXT2_FS : Support du système de fichiers ext2
CONFIG_EXT3_FS : Support du système de fichiers ext3
CONFIG_EXT4_FS : Support du système de fichiers ext4
CONFIG_REISERFS_FS : Support du système de fichiers ReiserFS
CONFIG_JFS_FS : Support du système de fichiers JFS
CONFIG_XFS_FS : Support du système de fichiers XFS
CONFIG_BTRFS_FS : Support du système de fichiers Btrfs
CONFIG_NILFS2_FS : Support du système de fichiers NILFS2
<br />

------------------------------------------------------------------------------------------------------------------------------------------
## VIII. Sécurité
CONFIG_SECURITY : Support de la sécurité
CONFIG_SECURITYFS : Support du système de fichiers de sécurité
CONFIG_SECURITY_PATH : Support du chemin de sécurité
CONFIG_SECURITY_NETWORK : Support du réseau de sécurité
CONFIG_SECURITY_NETWORK_XFRM : Support du réseau de sécurité pour les transformations
CONFIG_SECURITY_SELINUX : Support de SELinux
CONFIG_SECURITY_SMACK : Support de Smack
CONFIG_SECURITY_TOMOYO : Support de TOMOYO
CONFIG_SECURITY_APPARMOR : Support d'AppArmor
CONFIG_SECURITY_YAMA : Support de Yama

<br />

------------------------------------------------------------------------------------------------------------------------------------------
## VIV. Autres
CONFIG_MODULE_UNLOAD : Support du déchargement des modules
CONFIG_MODULE_FORCE_UNLOAD : Support du déchargement forcé des modules
CONFIG_MODVERSIONS : Support des versions


<br />


------------------------------------------------------------------------------------------------------------------------------------------
### A. XXXX
```
```

### B. XXXX
```
```

### C. XXXX
```
```

### D. XXXX
```
```

### E. XXXX
```
```

### F. XXXX
```
```

### G. XXXX
```
```

### H. XXXX
```
```

### I. XXXX
```
```

### K. XXXX
```
```

### L. XXXX
```
```

### M. XXXX
```
```

### N. XXXX
```
```


### O. XXXX
```
```

### P. XXXX
```
```

### Q. XXXX
```
```

### R. XXXX
```
```


### S. XXXX
```
```


### T. XXXX
```
```
