------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Installation de NodeJS </p>
------------------------------------------------------------------------------------------------------------------------------------
## I. Installation de NodeJS
### A. Dépendance
```bash
clear;
apt install curl;
```

### B. Téléchargement du script
```bash
clear;
curl -fsSL https://deb.nodesource.com/setup_23.x -o /tmp/nodesource_setup.sh;
```

### C. Installation du dépôt NodeJS
```bash
clear;
bash /tmp/nodesource_setup.sh;
```

### D. Installation de NodeJS
```bash
clear;
apt install nodejs;
```

### E. Afficher version de NodeJS
```bash
clear;
node -v;
```
