----------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Guide d'utilisation de SystemD </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Qu'est ce que SystemD ?
Systemd est un système d'initialisation et de gestion de services pour les systèmes d'exploitation Linux. Il remplace les anciens systèmes d'initialisation tels que SysVinit et Upstart.

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Utilisation de base
#### A. Gestion des services
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
##### 4. Etat d'un service
```bash
systemctl status <monservice.service>;
```
##### 5. Activer un service au démarrage
Le paramètre `--now` permet d'activer et de démarrer le service en même temps. 
```bash
systemctl enable <monservice.service>;
systemctl enable --now <monservice.service>;
```

##### 6. Désactiver un service au démarrage
Le paramètre `--now` permet de désactiver et de stopper le service en même temps. 
```bash
systemctl disable <monservice.service>;
systemctl disable --now <monservice.service>;
```


#### B. Journal d'événement
La commande `journalctl` permet de consulter les journaux système.
##### 1. Accéder au journal (Brute)
```bash
journalctl
```
##### 2. Accéder au journal en temps réel
Permet de voir le journal défilé en temps réel. Pratique pour du débuggage !!!
```bash
journalctl -f
```








----------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Utilisation avancée
