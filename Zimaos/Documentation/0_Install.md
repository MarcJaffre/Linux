----------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de ZimaOS </p>
----------------------------------------------------------------------------------------------------------------------------------------
## I. Installation
### A. Télécharger
Aller sur le GitHub [ZimaOS](https://github.com/IceWhaleTech/ZimaOS/releases) puis télécharger l'iso (Méthode Rufus) ou img (balenaEtcher)

### B. Création d'une clé USB
Depuis le logiciel (Rufus ou balenaEtcher), choisissez le fichier zimaos puis sélectionner le périphérique et valider.

Ceci formatera la clé.

### C. Obtenir l'adresse IP
Depuis l'écran de la machine ZimaOS on peut voir l'ip ou via un outil de scan réseau (Advanced IP Scanner). La machine s'appel `ZimaOS`.

### D. Installation

<p align='center'> <img width="939"  height="888" alt="image" src="https://github.com/user-attachments/assets/3345ef18-2b81-47aa-a8c4-9eac4b7d20cc" /> </p>

<p align='center'> <img width="930"  height="878" alt="image" src="https://github.com/user-attachments/assets/cf3badfa-2671-4eae-87eb-4f89dd46a0b2" /> </p>

<p align='center'> <img width="755"  height="444" alt="image" src="https://github.com/user-attachments/assets/34df54dd-3fe9-45aa-a47a-4c0fd49a62d8" /> </p>

### E. Post-Install
<p align='center'> <img width="697"  height="537" alt="image" src="https://github.com/user-attachments/assets/8415d461-c35b-4f76-93e6-5e8aa679fcd3" /> </p>

<p align='center'> <img width="695"  height="529" alt="image" src="https://github.com/user-attachments/assets/1adf69d4-49e3-4c20-b57a-ce15a99adbe5" /> </p>

<p align='center'> <img width="702"  height="527" alt="image" src="https://github.com/user-attachments/assets/c666b69c-a6e5-42f0-8534-e6c80ed51df7" /> </p>

<p align='center'> <img width="1097" height="925" alt="image" src="https://github.com/user-attachments/assets/b69f35de-314b-4945-85df-1f6264ea78b6" /> </p>

<br />

### F. Mise à jour
Il est nécessaire d'avoir activer la console SSH.
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

### G. Journal Système
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



<p align='center'> <img width="503" height="223" alt="image" src="https://github.com/user-attachments/assets/1c00c62c-44b0-40ea-b262-f7cde3f2a13d" />




