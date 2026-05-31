

-------------------------------------------------------------------------------------------------------
## II. Patch
### A. Installation des patchs 
#### 1. Documentation
Guide sur l'[application d'un patch](https://www.kernel.org/doc/html/v5.3/process/applying-patches.html#applying-patches) et sur l[installation des sources du  kernel](https://www.kernel.org/doc/html/v5.3/admin-guide/README.html#installing-the-kernel-source))

#### 2. Grand etape

| Kernel | Patch | Action 1                | Action 2                | Action 3              | Action 4              |
|--------|-------|-------------------------|-------------------------|-----------------------|-----------------------|
| 5.0.0  | 5.0.4 | Appliquer patch 5.0.4   | Vérifier kernel         | Installer le kernel   |                       |
| 5.0.3  | 5.0.4 | Réverser le patch 5.0.X | Vérifier kernel (5.0.0) | Appliquer patch 5.0.0 | Installer le kernel   |


Pour le Noyau 5, il faut appliquer le dernier patch. (Exemple: Kernel 5.0 et patch 5.0.4)

Pour un kernel 5.0.2 et un patch 5.0.3 : Il faut annulé le patchage des versions précédente puis repatché.

linux/scripts/patch-kernel linux

### Upgrade Kernel (5.7.2 > 5.7.3)
#### 1. Dossier de Travail
```bash
clear;
cd ~/linux-5.7.2
```

#### 2. Reverser Patch
Il est nécessaire de reverser le patch 5.7.2 pour obtenir le kernel 5.7.0 (Vanilla)
```bash
clear:
patch -p1 -R < ../patch-5.7.2
make kernelversion;
```

#### 3. Appliquer Patch
```bash
clear;
patch -p1 < ../patch-5.7.3
```
