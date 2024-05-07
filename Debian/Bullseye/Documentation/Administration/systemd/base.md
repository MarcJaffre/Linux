----------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Guide d'utilisation de SystemD </p>

----------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Qu'est ce que SystemD ?
Systemd est un système d'initialisation et de gestion de services pour les systèmes d'exploitation Linux. Il remplace les anciens systèmes d'initialisation tels que SysVinit et Upstart.

#### B. Comment fonctionne SystemD
Avec systemd, les services sont gérés en tant qu'unités : services, sockets, périphériques, des points de montage, etc. 

Chaque unité est décrite par un fichier de configuration spécifique qui définit son comportement et ses dépendances.

<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Utilisation de base
#### A. Gestion des services
La commande `systemctl`permet de contrôler les services système.
##### 1. Arrêter un service
```bash
systemctl stop <monservice.service>;
```

##### 2. Démarrer un service
```bash
systemctl start <monservice.service>;
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
systemctl enable       <monservice.service>;
systemctl enable --now <monservice.service>;
```

##### 6. Désactiver un service au démarrage
Le paramètre `--now` permet de désactiver et de stopper le service en même temps. 
```bash
systemctl disable       <monservice.service>;
systemctl disable --now <monservice.service>;
```

<br />



#### B. Journal d'événement
La commande `journalctl` permet de consulter les journaux système.
##### 1. Accéder au journal (Brute)
```bash
journalctl
```

##### 2. Journal en temps réel
Permet de voir le journal défilé en temps réel. Pratique pour du débuggage !!!
```bash
journalctl -f
```

##### 3. Journal avec filtrage des événements
Les événements du journal sont catégorisés en 3 : Error, Warning et Info

Un Warning est un événement qui s'est mal passé mais qui n'a pas bloqué l'activité.

Une error est un événement qui a planté et qui est bloquant pour l'activité. (Erreur de configuration, permission, fichier indispo ...)

Lorsqu'on définit un niveau de filtre on part de droite à gauche . (ERR <= WARNING <= INFO)

Si on filtre sur Warning, on verra les Warning et les error, donc sa exclus les info par exemple.

```bash
journalctl -p info;
journalctl -p warning;
journalctl -p err;
```

##### 3. Journal avec filtrage des événements sur un service
Supposons qu'on souhaite les événéments de type d'erreur sur un service.

```bash
journalctl -p err -u <monservice.service>;
```


<br />
<br />

----------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Utilisation avancée
#### A. Les différents Unités de SystemD
##### 1. Service
```
Ils sont utilisées pour définir et gérer les services système.

Elles peuvent être utilisées pour démarrer, arrêter, redémarrer et surveiller les services.
```

##### 2. Socket
```
Ils sont utilisées pour définir et gérer les sockets réseau ou Unix.

Elles peuvent être utilisées pour activer ou désactiver les sockets, ainsi que pour spécifier les options de configuration des sockets.
```
##### 4. Device
```
Ils sont utilisées pour définir et gérer les périphériques matériels.

Elles peuvent être utilisées pour activer ou désactiver les périphériques, ainsi que pour spécifier les options de configuration des périphériques.
```

##### 6. Mount
```
Ils sont utilisées pour définir et gérer les points de montage des systèmes de fichiers.

Elles peuvent être utilisées pour monter et démonter les systèmes de fichiers, ainsi que pour spécifier les options de montage.
```

##### 7. Target
```
Ils sont utilisées pour définir et gérer les cibles système.
```

##### 8. Timer
```
Ils sont utilisées pour définir et gérer les timers système.

Elles peuvent être utilisées pour planifier des tâches à exécuter à des moments spécifiques.
```

##### 9. Path
```
Ils sont utilisées pour définir et gérer les chemins de fichiers ou de répertoires.

Elles peuvent être utilisées pour surveiller les modifications dans les fichiers ou répertoires spécifiés.
```

##### 10. Scope
```
Ils sont utilisées pour définir et gérer les scopes système.

Elles peuvent être utilisées pour isoler les processus dans un environnement contrôlé.
```

<br />

#### A. Lister les Units de SystemD
Pour pouvoir gérer correctement les services, il est nécessaire d'avoir une vu complète de l'ensemble des services Linux.
```bash
systemctl list-unit-files;
```

```bash
systemctl list-unit-files --type=service --state=enabled;

# --user;
# --type=<automount,device,mount,path,scope,service,slice,socket,swap,target,timer>
# --state=<enabled,disabled>;
``` 
