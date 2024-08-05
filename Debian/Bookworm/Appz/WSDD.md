------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation de paquet WSDD </p>

------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation du paquet
Le paquet WSDD (Web Service Discovery Daemon) permet d'avoir la découverte réseau et donc de voir la machine sur le réseau depuis un autre poste.

------------------------------------------------------------------------------------------------------------------------------------------------
### II. Installation 
```bash
clear;
apt install -y wsdd;
```

------------------------------------------------------------------------------------------------------------------------------------------------
### III. Docker
#### A. Code d'erreur
```bash
clear;
systemctl status wsdd.service
```

```
WARNING: no interface given, using all interfaces
ERROR: error while sending packet on docker0: [Errno 101] Network is unreachable

ERROR: Exception in callback NetlinkAddressMonitor.handle_request()
       handle: <Handle NetlinkAddressMonitor.handle_request()>

Traceback (most recent call last):
   File "/usr/lib/python3.11/asyncio/events.py", line 80, in _run
   File "/usr/sbin/wsdd", line 1330, in handle_request

OSError: [Errno 105] No buffer space available
```


#### B. Correctif
Le protocole WSDD n'aime pas docker, il faut indiquer à WSDD de ne pas écouter sur les interfaces de docker.

Le paramètre `WSDD_PARAMS=""` du fichier `/etc/default/wsdd` est à modifier.

Nous souhaitons que WSDD écoute sur les interfaces `eth0` et `wlan0` via le protocole ipv4 uniquement. (`WSDD_PARAMS=" -i eth0 -4 -i wlan0 -4"`)

##### 1. Application du correctif
```bash
clear;
sed -i -e "s/WSDD_PARAMS\=\"\"/WSDD_PARAMS\=\"-i eth0 -4 -i wlan0 -4\"/g" /etc/default/wsdd;
systemctl restart wsdd;
systemctl is-active wsdd;
```

##### 2. Retour en arrière
```bash
clear;
sed -i -e "s/WSDD_PARAMS\=\"-i eth0 -4 -i wlan0 -4\"/WSDD_PARAMS\=\"\"/g" /etc/default/wsdd;
systemctl restart wsdd;
systemctl is-active wsdd;
```
