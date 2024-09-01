------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration d'un Noyau Debian - Memory </p>

------------------------------------------------------------------------------------------------------------------------------------------
## I. Configuration du Noyau
### A. Accéder au menu de configuration
Aller dans le dossier du Noyau et taper la commande `make menuconfig` .

<br />

------------------------------------------------------------------------------------------------------------------------------------------
## II. General
- CONFIG_DEFAULT_DOMAINNAME : Nom de domaine par défaut
- CONFIG_KERNEL_COMPILE : Compileur utilisé pour compiler le noyau
- CONFIG_KERNEL_CROSS_COMPILE : Compileur croisé utilisé pour compiler le noyau
- CONFIG_KERNEL_GIT : Git du noyau
- CONFIG_DEFAULT_HOSTNAME : Nom d'hôte par défaut
- CONFIG_KERNEL_RELEASE : Release du noyau
- CONFIG_KERNEL_VERSION : Version du noyau

<br />





<br />

------------------------------------------------------------------------------------------------------------------------------------------
## IV. Mémoire
CONFIG_HIGHMEM : Support de la mémoire haute
CONFIG_HIGHMEM64 : Support de la mémoire haute 64 bits
CONFIG_HIGHPTE : Support des tables de pages haute
CONFIG_MEMORY_FAILURE : Support de la défaillance de la mémoire
CONFIG_MEMORY_HOTPLUG : Support du retrait à chaud de la mémoire
CONFIG_MEMORY_HOTREMOVE : Support du retrait à chaud de la mémoire

<br />
