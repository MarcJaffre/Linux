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
```
root@PI5:~# systemctl status wsdd.service
wsdd[856]: WARNING: no interface given, using all interfaces
wsdd[856]: ERROR: error while sending packet on docker0: [Errno 101] Network is unreachable
wsdd[856]: ERROR: Exception in callback NetlinkAddressMonitor.handle_request()
wsdd[856]: handle: <Handle NetlinkAddressMonitor.handle_request()>
wsdd[856]: Traceback (most recent call last):
wsdd[856]:   File "/usr/lib/python3.11/asyncio/events.py", line 80, in _run
wsdd[856]:   File "/usr/sbin/wsdd", line 1330, in handle_request
wsdd[856]: OSError: [Errno 105] No buffer space available
```

#### B. Correctif
Le protocole WSDD n'aime pas docker, il faut indiquer à WSDD de ne pas écouter sur les interfaces de docker.

Le paramètre `WSDD_PARAMS=""` du fichier `/etc/default/wsdd` est à modifier.

Nous souhaitons que WSDD écoute sur les interfaces `eth0` et `wlan0` via le protocole ipv4 uniquement. (`WSDD_PARAMS="-i eth0 wlan0 -4"`)

##### 1. Application du correctif
```bash
clear;
sed -i -e "s/WSDD_PARAMS\=\"\"/WSDD_PARAMS\=\"-i eth0 wlan0 -4\"/g" /etc/default/wsdd;
systemctl restart wsdd;
systemctl status wsdd;
```

##### 2. Retour en arrière
```bash
clear;
sed -i -e "s/WSDD_PARAMS\=\"-i eth0 wlan0 -4\"/WSDD_PARAMS\=\"\"/g" /etc/default/wsdd;
systemctl restart wsdd;
systemctl status wsdd;
```
