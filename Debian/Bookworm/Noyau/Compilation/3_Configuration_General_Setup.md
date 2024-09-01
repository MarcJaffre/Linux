------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration d'un Noyau Debian - General Setup </p>

------------------------------------------------------------------------------------------------------------------------------------------
## I. Configuration du Noyau
### A. Accéder au menu de configuration
Aller dans le dossier du Noyau et taper la commande `make xconfig` .


<br />

------------------------------------------------------------------------------------------------------------------------------------------
## II. Base
Les options suivants ont étés relevés sur le Kernel 6.10.7 de Kernel.org
### A. Genetal Setup (+30 options)
#### 1. Compile also drivers which will not load [N]
Cette option permet de compiler les pilotes qui ne seront pas chargés par défaut. Cela peut être utile pour les développeurs de pilotes ou pour les utilisateurs qui veulent avoir accès à des pilotes expérimentaux.

#### 2. Compile the kernel with warnings as errors [N]
Cette option permet de traiter les avertissements de compilation comme des erreurs. Cela signifie que si un avertissement est détecté pendant la compilation, la compilation sera arrêtée.

#### 3. Local Version - apprend to kernel release [Custom]
Cette option permet d'ajouter une chaîne de caractères personnalisée à la version du kernel. Cela peut être utile pour identifier une version personnalisée du kernel.

#### 4. Build ID Salt [???]
Cette option permet de spécifier une valeur de "salt" pour le Build ID du kernel. Le Build ID est une valeur unique qui identifie une version spécifique du kernel.

#### 5. Kernel compression mode [Zstd]
Cette option permet de choisir le mode de compression du kernel. 

Les options disponibles sont : 
- Gzip  : X86 et x64
- Lzma  : Arm et ARM64
- Bzip2 :
- Xz    :
- Lzo   :
- Zstd  : Est très rapide pour compresser les données, ce qui est important pour les applications où la compression est effectuée en temps réel.

| Algorithme  | Temps de compression (s) | Temps de décompression (s) |
| ----------- | ------------------------ | -------------------------- |
| ZSTD        | 1.3 Sec                  | 0.5 Sec                    |
| Gzip        | 2.5 Sec                  | 1.2 Sec                    |


#### 6. Default init path [/sbin/init]
Cette option permet de spécifier le chemin d'accès par défaut pour les fichiers d'initialisation du système.

#### 7. Default Hostname [Debian]
Cette option permet de spécifier le nom d'hôte par défaut pour le système.

#### 8. System V IPC [Y]
Cette option permet d'activer ou de désactiver les fonctionnalités de communication inter-processus (IPC) de System V.

#### 9. POSIX Message queues [Y]
Cette option permet d'activer ou de désactiver les files d'attente de messages POSIX.

#### 10. General notification queue
Cette option permet d'activer ou de désactiver la file d'attente de notifications générales.

#### 11. Enable process_vm_readv/writev_syscalls
Cette option permet d'activer ou de désactiver les appels système process_vm_readv et process_vm_writev.

#### 12. uselib syscall (for libc5 and earlier)
Cette option permet d'activer ou de désactiver l'appel système uselib pour les versions de libc antérieures à la 5.

#### 13. Auditing support
Cette option permet d'activer ou de désactiver la prise en charge de l'audit.

#### 14. Preemption Model
Cette option permet de choisir le modèle de préemption du kernel. 

Les options disponibles sont : 
* No Forced Preemption (Server)
* Voluntary Kernel Preemption (Desktop)
* Preemptible Kernel (Low-Latency Desktop)

#### 15. Preemption behaviour defined on boor
Cette option permet de spécifier le comportement de préemption à l'amorçage.

#### 16. Core Scheduling for SMT
Cette option permet d'activer ou de désactiver la planification des cœurs pour les processeurs SMT.

#### 17. CPU Isolation
Cette option permet d'activer ou de désactiver l'isolation des processeurs.

#### 18. Kernel .config support
Cette option permet d'activer ou de désactiver la prise en charge du fichier de configuration du kernel.

#### 19. Enable kernel headers throught /sys/kernel/kheaders.tar.xz
Cette option permet d'activer ou de désactiver l'accès aux en-têtes du kernel à travers le fichier /sys/kernel/kheaders.tar.xz.

#### 20. Kernel log buffer size 
Cette option permet de spécifier la taille du tampon de journalisation du kernel.

#### 21. CPU Kernel log buffer size contribution
Cette option permet de spécifier la contribution de chaque processeur à la taille du tampon de journalisation du kernel.

#### 22. Printk indexing debugfs interface
Cette option permet d'activer ou de désactiver l'interface de débogage printk.

#### 23. Memory placement award NUMA scheduler
Cette option permet d'activer ou de désactiver la prise en compte de la placement de la mémoire pour les planificateurs NUMA.

#### 24. Checkpoint/restore support
Cette option permet d'activer ou de désactiver la prise en charge de la sauvegarde et de la restauration des processus.

#### 25. Automatic process group scheduling
Cette option permet d'activer ou de désactiver la planification automatique des groupes de processus.

#### 26. Kernel -> user space relay support
Cette option permet d'activer ou de désactiver la prise en charge du relais entre le kernel et l'espace utilisateur.

#### 27. Initial Ram filesystem and RAM disk (initramfs/initrd) support
Cette option permet de compiler le support pour les systèmes de fichiers et les disques RAM initiaux (initramfs/initrd). Un système de fichiers RAM initial est une archive compressée qui contient les fichiers nécessaires pour démarrer le système, tandis qu'un disque RAM est un espace de stockage temporaire utilisé pendant le démarrage. Si vous activez cette option, vous pourrez utiliser des systèmes de fichiers et des disques RAM initiaux pour démarrer votre système.

#### 28. Boot config support 
Cette option permet de compiler le support pour les configurations de démarrage. Les configurations de démarrage définissent les paramètres de démarrage du système, tels que les options de noyau, les paramètres de l'interface réseau, etc. Si vous activez cette option, vous pourrez utiliser des configurations de démarrage personnalisées pour démarrer votre système.

#### 29. Preserve cpio archive mtimes in intiramfs
Cette option permet de conserver les dates de modification (mtimes) des archives cpio dans les systèmes de fichiers RAM initiaux (initramfs). Les archives cpio sont utilisées pour stocker les fichiers dans les systèmes de fichiers RAM initiaux. Si vous activez cette option, les dates de modification des archives cpio seront conservées dans les systèmes de fichiers RAM initiaux.


#### 30. Compiler optimieation level
Cette option permet de définir le niveau d'optimisation du compilateur pour la compilation du noyau. 

Les niveaux d'optimisation définissent la quantité d'optimisation effectuée par le compilateur pour améliorer les performances du code généré. 

Les niveaux d'optimisation les plus courants sont :
-O0 : pas d'optimisation
-O1 : optimisation légère
-O2 : optimisation moyenne
-O3 : optimisation élevée

#### 31. Profiling support
Cette option permet de compiler le support pour le profilage.

Le profilage est une technique qui permet de mesurer les performances du code en cours d'exécution.

Si vous activez cette option, vous pourrez utiliser des outils de profilage pour analyser les performances de votre noyau.









<br />

### B. IRQ subsystem
#### 1. Expose irq internals in debugfs

<br />

### C. Timers subsystem
#### 1. Timer tick handling
#### 2. Force user context tracking
#### 3. Old Idle dynticks config
#### 4. High Resolution Timer Support
#### 5. ClockSource Watchdog maximum allowable skew (in ms)

<br />

### D. CPU/Task time and stats accounting
<br />

### E. RCU SubSystem
<br />

### F. Scheduler Features
<br />

### G. Control Group Support
<br />

### H. Namespaces support
<br />

### I. Configure standard kernel features
<br />
 
### J. Kernel Performance Events And Counters
<br />

### K. Kexec and crash features
<br />
