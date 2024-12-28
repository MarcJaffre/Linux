---------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration de Visudo </p>
---------------------------------------------------------------------------------------------------------------
### I. Visudo
#### A. Présentation

#### B. Edition de Sudo
```
visudo
```

#### C. Alias d'hôtes
```
Host_Alias MACHINE = bookworm
```

#### D. Alias User
```
User_Alias ADMIN = marc
```

#### E. Alias commandes
```
Cmnd_Alias SHUTDOWN = /sbin/shutdown
Cmnd_Alias CHPASSWD = /usr/bin/passwd
Cmnd_Alias INTERDIT = !/usr/bin/passwd root
```

#### F. Permissions
```
ADMIN   MACHINE=(root) SHUTDOWN, CHPASSWD, INTERDIT
```

#### G. Vérification
```
sudo -l -U marc
```
