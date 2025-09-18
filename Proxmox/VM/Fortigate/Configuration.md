-----------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration du routeur Fortigate </p>
-----------------------------------------------------------------------------------------------------------------------
## I. Configuration de base
### A. Settings (Hostname, NTP, Langue)
Dans le bandeau de gauche, sélectionner le menu `Settings`.

```
Host name : Fortigate
Time zone : (UTC+1:00) Europe/Paris
Setup device as local NTP server : OFF

HTTP port  : 80
HTTPS port : 443
SSH port   : 22

Language : French
```

<br />

-----------------------------------------------------------------------------------------------------------------------
## II. Configuration du réseau
### B. Réseau
#### 1. Interfaces 
##### WAN
Dans le bandeau de gauche, sélectionner le menu `Réseau` > `Interfaces`.

Sélectionner l'interface qui correspond au `WAN` puis cliquer sur `Modifier`.

<img width="869" height="344" alt="image" src="https://github.com/user-attachments/assets/e9386b81-0197-428e-ae30-89ebb9c47a0e" />

<img width="860" height="138" alt="image" src="https://github.com/user-attachments/assets/459f20cb-a727-432a-a1da-8830c64ffbfe" />

##### LAN
Sélectionner l'interface qui correspond au `LAN` puis cliquer sur `Modifier`.

<img width="850" height="173" alt="image" src="https://github.com/user-attachments/assets/1aa8222c-fe97-41ab-85cc-77f5e05d81f5" />

<img width="856" height="218" alt="image" src="https://github.com/user-attachments/assets/328bff8f-4637-499e-94f8-b12e0362cf0c" />

<br />

#### 2. Route
