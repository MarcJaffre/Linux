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
#### 1. Compile also drivers which will not load
Cette option permet de compiler les pilotes qui ne seront pas chargés par défaut. Cela peut être utile pour les développeurs de pilotes ou pour les utilisateurs qui veulent avoir accès à des pilotes expérimentaux.

#### 2. Compile the kernel with warnings as errors
Cette option permet de traiter les avertissements de compilation comme des erreurs. Cela signifie que si un avertissement est détecté pendant la compilation, la compilation sera arrêtée.

#### 3. Local Version - apprend to kernel release
Cette option permet d'ajouter une chaîne de caractères personnalisée à la version du kernel. Cela peut être utile pour identifier une version personnalisée du kernel.

#### 4. Build ID Salt
Cette option permet de spécifier une valeur de "salt" pour le Build ID du kernel. Le Build ID est une valeur unique qui identifie une version spécifique du kernel.

#### 5. Kernel compression mode
Cette option permet de choisir le mode de compression du kernel. Les options disponibles sont : * Gzip * Bzip2 * Lzma * Xz * Lzo * Zstd

#### 6. Default init path
Cette option permet de spécifier le chemin d'accès par défaut pour les fichiers d'initialisation du système.

#### 7. Default Hostname
Cette option permet de spécifier le nom d'hôte par défaut pour le système.

#### 8. System V IPC

#### 9. POSIX Message queues

#### 10. General notification queue

#### 11. Enable process_vm_readv/writev_syscalls

#### 12. uselib syscall (for libc5 and earlier)

#### 13. Auditing support

#### 14. Preemption Model

#### 15. Preemption behaviour defined on boor

#### 16. Core Scheduling for SMT

#### 17. CPU Isolation

#### 18. Kernel .config support

#### 19. Enable kernel headers throught /sys/kernel/kheaders.tar.xz

#### 20. Kernel log buffer size 

#### 21. CPU Kernel log buffer size contribution

#### 22. Printk indexing debugfs interface

#### 23. Memory placement award NUMA scheduler

#### 24. Checkpoint/restore support

#### 25. Automatic process group scheduling

#### 26. Kernel -> user space relay support

#### 27. Initial Ram filesystem and RAM disk (initramfs/initrd) support

#### 28. Boot config support 

#### 29. Preserve cpio archive mtimes in intiramfs

#### 30. Compiler optimieation level

#### 31. Profiling support

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
