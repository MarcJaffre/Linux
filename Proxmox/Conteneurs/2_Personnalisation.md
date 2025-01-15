------------------------------------------------------------------------------------------------------
# <p align='center'> Personnalisation d'un conteneur </p>
------------------------------------------------------------------------------------------------------
## I. Personnalisation basique
### A. Présentation
L'objectif est de préparer le système d'exploitation.

> Création d'un script sur la machine hôte.
>
> Transfert du script de la machine hôte vers l'inviter.
>
> Lancement du script sur la machine invitée

### B. Se connecter au conteneur
```bash
clear;
pct enter 999;
```

### C. Remote Command
#### 1. Création d'un script (Host PVE)
On peux utiliser `pct exec 999 -- bash -c '....'` pour envoyer une commande à distance.
```bash
clear;
cat > install.sh << EOF
#!/usr/bin/bash
apt update;
apt upgrade -y;
sed -i -e "s/\#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config;
systemctl restart ssh;
EOF
```

#### 2. Transférer un fichier
```bash
clear;
pct push 999 /root/install.sh /root/install.sh;
```

#### 3. Modification des permissions (Guest)
```bash
clear;
pct exec 999 -- bash -c 'chmod +x /root/install.sh'
```
#### 4. Lancement du script
```bash
clear;
pct exec 999 -- bash -c '/root/install.sh'
```
