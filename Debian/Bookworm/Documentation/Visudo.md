---------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration de Visudo </p>
---------------------------------------------------------------------------------------------------------------
### I. 
#### A. Alias d'hôtes
```
Host_Alias MACHINE = bookworm
```

#### B. Alias User
```
User_Alias ADMIN = marc
```

#### C. Alias commandes
```
Cmnd_Alias SHUTDOWN = /sbin/shutdown
Cmnd_Alias CHPASSWD = /usr/bin/passwd
Cmnd_Alias INTERDIT = !/usr/bin/passwd root
```

#### D. Permissions
```
ADMIN   MACHINE=(root) SHUTDOWN, CHPASSWD, INTERDIT
```

#### E. Vérification
```
sudo -l -U marc
```
