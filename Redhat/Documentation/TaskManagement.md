------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Gestions des Processus </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
Un processus est identifié par un `PID` (**P**rocess **ID**entifier) et si c'est un processus parent `PPID` (**P**arent **P**rocess **ID**entifier).

Ce processus est rattaché à un Utilisateur et un Groupe propriétaire, un environnement et dispose d'une priorité.




<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Introduction au processus
#### A. Lancer un processus
##### 1. Première plan
```
find / -name ssh;
```
##### 2. Arrière-plan
```
find / -name ssh &;
```
#### B. Visualisé l'état d'un PID
```
cat /proc/<PID>/status
```

#### C. Etat du processus en mémoire
```
Prêt en attente : En file d'attente dans le CPU
Suspendu        : Reprise Possible
Terminé         : Processus terminé proprement
Zombie          : Processus qui lancer d'autre processus (enfant) et celui-ci attends que les processus enfants se terminent
```


<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### III. Surveiller les processus



<br />
<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### IV. Administrer les processus

