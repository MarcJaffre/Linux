----------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation et Configuration de ZimaOS </p>
----------------------------------------------------------------------------------------------------------------------------------------
## I. Installation
### A. Télécharger
Aller sur le GitHub [ZimaOS](https://github.com/IceWhaleTech/ZimaOS/releases) puis télécharger l'iso (Méthode Rufus) ou img (balenaEtcher)

### B. Création d'une clé USB
Depuis le logiciel (Rufus ou balenaEtcher), choisissez le fichier zimaos puis sélectionner le périphérique et valider.

Ceci formatera la clé.

### C. Installation

<p align='center'> <img width="939"  height="888" alt="image" src="https://github.com/user-attachments/assets/3345ef18-2b81-47aa-a8c4-9eac4b7d20cc" /> </p>

<p align='center'> <img width="930"  height="878" alt="image" src="https://github.com/user-attachments/assets/cf3badfa-2671-4eae-87eb-4f89dd46a0b2" /> </p>

<p align='center'> <img width="755"  height="444" alt="image" src="https://github.com/user-attachments/assets/34df54dd-3fe9-45aa-a47a-4c0fd49a62d8" /> </p>

### D. Post-Install
<p align='center'> <img width="697"  height="537" alt="image" src="https://github.com/user-attachments/assets/8415d461-c35b-4f76-93e6-5e8aa679fcd3" /> </p>

<p align='center'> <img width="695"  height="529" alt="image" src="https://github.com/user-attachments/assets/1adf69d4-49e3-4c20-b57a-ce15a99adbe5" /> </p>

<p align='center'> <img width="702"  height="527" alt="image" src="https://github.com/user-attachments/assets/c666b69c-a6e5-42f0-8534-e6c80ed51df7" /> </p>

<p align='center'> <img width="1097" height="925" alt="image" src="https://github.com/user-attachments/assets/b69f35de-314b-4945-85df-1f6264ea78b6" /> </p>

<br />

#### E. Mise à jour
```bash
clear;
zimaos -u;
```

```
Usage of zimaos:
  -c string
        config address
  -license-info
        print license information
  -u    update system (optionally specify version, e.g., -u or -u 1.2.3)
  -v    version
```

<br />

#### F. Journal Système
```bash
root@vm65n:/root ➜ # dmesg --level 4
[    0.085872] MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
[    0.085872] MMIO Stale Data CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/processor_mmio_stale_data.html for more details.
[    0.830676] hpet_acpi_add: no address or irqs in _CRS
[    0.914973] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.149535] ata2.00: Model 'Samsung SSD 850 EVO 250GB', rev 'EMT02B6Q', applying quirks: noncqtrim zeroaftertrim
[    1.149787] ata2.00: supports DRM functions and may not be fully accessible
[    1.153141] ata2.00: supports DRM functions and may not be fully accessible
[    5.320751] systemd[1]: multi-user.target: Found ordering cycle on getty.target/start
[    5.320756] systemd[1]: multi-user.target: Found dependency on zimaos-welcome@tty1.service/start
[    5.320758] systemd[1]: multi-user.target: Found dependency on multi-user.target/start
[    5.412701] spl: loading out-of-tree module taints kernel.
[    5.468401] zfs: module license 'CDDL' taints kernel.
[    5.468405] Disabling lock debugging due to kernel taint
[    5.468444] zfs: module license taints kernel.
[    8.777862] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  580.105.08  Wed Oct 29 23:15:11 UTC 2025
[   15.730118] warning: `lshw' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211
[   27.262928] nvidia_uvm: module uses symbols nvUvmInterfaceDisableAccessCntr from proprietary module nvidia, inheriting taint.
root@vm65n:/root ➜ #
```

<br />

----------------------------------------------------------------------------------------------------------------------------------------
## I. Configuration de base 
### A. Settings (General)
#### 1. Renommer la machine
<p align='center'> <img width="852" height="491" alt="image" src="https://github.com/user-attachments/assets/2d55fc8a-fc04-4731-8a15-d59adbb535c2" />
#### 2. Mode développeur
Le mode Développeur permet d'accéder au option avancé du NAS.
<p align='center'> <img width="848" height="606" alt="image" src="https://github.com/user-attachments/assets/5e4c39ec-ba2f-4820-a4c1-a5107c343c5c" /> </p>

<p align='center'> <img width="595" height="66"  alt="image" src="https://github.com/user-attachments/assets/9f6b1aab-e534-4903-a401-9808b5c8e0df" /> </p>

<p align='center'> <img width="590" height="222" alt="image" src="https://github.com/user-attachments/assets/de12e5e6-f6fb-4132-9c41-f48a02a91c3a" /> </p>

### B. Settings (Réseau)
<p align='center'> <img width="838" height="592" alt="image" src="https://github.com/user-attachments/assets/6af4f1e3-22cc-44c9-86d2-9c026b481d20" /> </p>

<p align='center'> <img width="540" height="612" alt="image" src="https://github.com/user-attachments/assets/9fdf260d-3674-4c31-8d5d-433013885a97" /> </p>

<p align='center'> <img width="634" height="198" alt="image" src="https://github.com/user-attachments/assets/a318a8f0-e49b-427c-9cf5-4f7a292d69de" /> </p>

### C. Settings (Applications)
Permet de définir le stockage es données de l'application (Natif), Image de l'application (Docker) et Données des utilisateurs (Home).

Chaque `App Data location` est migrable dans un autre stockage.

La fonction `Docker Cache Cleanup` permet la purge des images de Docker pour éviter d'encombré le stockage.

<p align='center'> <img width="844" height="585" alt="image" src="https://github.com/user-attachments/assets/e47e0f36-6cbe-441f-a704-e0eceff15020" /> </p>

<p align='center'> <img width="503" height="223" alt="image" src="https://github.com/user-attachments/assets/1c00c62c-44b0-40ea-b262-f7cde3f2a13d" />




