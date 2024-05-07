----------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Guide d'utilisation de SystemD </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Qu'est ce que SystemD ?
Systemd est un système d'initialisation et de gestion de services pour les systèmes d'exploitation Linux. Il remplace les anciens systèmes d'initialisation tels que SysVinit et Upstart.

----------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Utilisation de base
#### A. systemctl
La commande `systemctl`permet de contrôler les services système.
##### 1. Arrêter un service
```bash
systemctl stop    <monservice.service>;
```
##### 2. Démarrer un service
```bash
systemctl start   <monservice.service>;
```
##### 3. Redémarrer un service
```bash
systemctl restart <monservice.service>;
```







----------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Utilisation avancée
