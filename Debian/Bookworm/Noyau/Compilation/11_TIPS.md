----------------------------------------------------------------------------------------------------------------
# <p align='center'> Résolution des problèmes </p>

----------------------------------------------------------------------------------------------------------------
### Make Menuconfig
Pour recherche une variable, il suffit de taper la touche `/` .

### B. BTF
#### 1. Erreur (Compilation du Kernel)
```
BTF: .tmp_vmlinux1: pahole (pahole) is not available
Failed to generate BTF for vmlinux
Try to disable CONFIG_DEBUG_INFO_BTF
make[2]: *** [scripts/Makefile.vmlinux:34 : vmlinux] Erreur 1
make[1]: *** [/Data/linux-6.10.7/Makefile:1171 : vmlinux] Erreur 2
make[1]: *** Attente des tâches non terminées....
```
#### 2. Présentation
Le paquet pahole est un outil de ligne de commande qui permet d'analyser et de modifier les informations de débogage des fichiers objets et des bibliothèques partagées. 

Il est principalement utilisé pour inspecter et modifier les informations de débogage DWARF (Debug With Arbitrary Record Format) dans les fichiers objets et les bibliothèques partagées.


#### 3. Solutions
Installer le paquet Pahole (`apt install -y pahole`) ou modifier la valeur de `DEBUG_INFO_BTF` sur `N`.

`Kernel Hacking` > `Compile-time Checks and compiler optiond` >  `Generate BTF Type info`

```bash
clear;
apt install -y pahole;
```

