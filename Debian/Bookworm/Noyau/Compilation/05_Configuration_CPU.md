------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration d'un Noyau Debian - Processeur </p>
------------------------------------------------------------------------------------------------------------------------------------------
## I. Processeur
- CONFIG_CPU_FREQ : Gestion de la fréquence d'horloge du processeur
- CONFIG_CPU_FREQ_GOV_COMMON : Gestionnaire de fréquence d'horloge du processeur
- CONFIG_CPU_FREQ_GOV_PERFORMANCE : Gestionnaire de fréquence d'horloge du processeur pour les performances
- CONFIG_CPU_FREQ_GOV_POWERSAVE : Gestionnaire de fréquence d'horloge du processeur pour l'économie d'énergie
- CONFIG_CPU_FREQ_GOV_USERSPACE : Gestionnaire de fréquence d'horloge du processeur pour les utilisateurs
- CONFIG_CPU_HOTPLUG : Support du retrait à chaud du processeur
- CONFIG_CPU_IDLE : Support de l'arrêt du processeur
- CONFIG_CPU_IDLE_GOV_LADDER : Gestionnaire d'arrêt du processeu

Processor Type and Features
> CONFIG_MK8 : Pour les processeurs AMD Ryzen et EPYC

> CONFIG_MK9 : Pour les processeurs AMD Ryzen 3000 et EPYC Rome

> CONFIG_INTEL_CORE2 : Pour les processeurs Intel Core 2 et plus récents

> CONFIG_X86_64 : Pour les processeurs x86-64 (AMD et Intel)


