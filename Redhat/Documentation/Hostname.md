----------------------------------------------------------------------------------------------------
## <p align='center'> Configurer le Hostname </p>

----------------------------------------------------------------------------------------------------
### III. Hostname
#### A. Aficher le nom de la machine
```bash
clear;
hostname
```
#### B. Affîcher les informations
```bash
clear;
hostnamectl status
```

#### C. Définir le nom de la machine
```bash
clear;
hostnamectl set-hostname PRX-REDHAT01;
```

#### D. Définir la localité
```bash
clear;
hostnamectl location Paris;
```

#### E. Définir la date de déploiement
```bash
clear;
hostnamectl deployment $(date +"%d-%m-%y-%HH%m")
```

#### F. Définir le Chassis
```bash
clear;
hostnamectl chassis desktop
hostnamectl chassis laptop
hostnamectl chassis server

hostnamectl chassis container
hostnamectl chassis vm
```
