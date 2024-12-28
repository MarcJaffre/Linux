---------------------------------------------------------------------------------------------------------------
## <p align='center'> Configuration de Visudo </p>
---------------------------------------------------------------------------------------------------------------
### I. Visudo
#### A. Edition de Sudo
```
visudo
```

#### B. Alias d'hôtes
```
Host_Alias MACHINE = bookworm
```

#### C. Alias User
```
User_Alias ADMIN = marc
```

#### D. Alias commandes
```
Cmnd_Alias SHUTDOWN = /sbin/shutdown
Cmnd_Alias CHPASSWD = /usr/bin/passwd
Cmnd_Alias INTERDIT = !/usr/bin/passwd root
```

#### E. Permissions
```
ADMIN   MACHINE=(root) SHUTDOWN, CHPASSWD, INTERDIT
```

#### F. Vérification
```
sudo -l -U marc
```
