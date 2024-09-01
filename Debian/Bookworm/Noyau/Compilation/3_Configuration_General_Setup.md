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
#### 2. Compile the kernel with warnings as errors
#### 3. Local Version - apprend to kernel release
#### 4. Build ID Salt
#### 5. Kernel compression mode
#### 6. Default init path
#### 7. Default Hostname
#### 8. System V IPC
#### 9. POSIX Message queues
#### 10. General notification queue
#### 11. Enable process_vm_readv/writev_syscalls
#### 12. uselib syscall (for libc5 and earlier)
#### 13. Auditing support### 
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

### 
### 


### 
```
```
