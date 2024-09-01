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
### A. Genetal Setup
#### Compile also drivers which will not load
#### Compile the kernel with warnings as errors
#### Local Version - apprend to kernel release
#### Build ID Salt
#### Kernel compression mode
#### Default init path
#### Default Hostname
#### System V IPC
#### POSIX Message queues
#### General notification queue
#### Enable process_vm_readv/writev_syscalls
#### uselib syscall (for libc5 and earlier)
#### Auditing support### 
#### Preemption Model
#### Preemption behaviour defined on boor
#### Core Scheduling for SMT
#### CPU Isolation
#### Kernel .config support
#### Enable kernel headers throught /sys/kernel/kheaders.tar.xz
#### Kernel log buffer size 
#### CPU Kernel log buffer size contribution
#### Printk indexing debugfs interface
#### Memory placement award NUMA scheduler
#### Checkpoint/restore support
#### Automatic process group scheduling
#### Kernel -> user space relay support
#### Initial Ram filesystem and RAM disk (initramfs/initrd) support
#### Boot config support 
#### Preserve cpio archive mtimes in intiramfs
#### Compiler optimieation level
#### Profiling support

------------------------------------------------------------------------------------------------------------------------------------------
## II. Autres
### B. IRQ subsystem
#### 1. Expose irq internals in debugfs

### 
### 
### 
### 
### 
### 
### 


### 
```
```
