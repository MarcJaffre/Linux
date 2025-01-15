--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# <p align='center'> Mise en place du Stickybit </p>
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. StickyBit
### A. Présentation
Permet de définir un dossier commun à tout le monde mais seul le propriétaire ou root peut supprimer la racine.

/ ! \ Ne pas faire de Stickybit dans le dossier d'un User dans Truenas, sa marchera pas.

### B. Suppression du Dossier Public
```bash
clear;
rm -rf /home/public 2>/dev/null;
```

### C. Creation de Public et des sous-dosiers
```bash*
clear;
mkdir -p /home/public/{Documents,Images,Musique,Video,Telechargements};
```

### D. Définir un propriétaire
```bash
clear;
chown -R root:root /home/public/{Documents,Images,Musique,Video,Telechargements};
```

### D. StickyBit
```bash
clear;
chmod -R 1777 /home/public/{Documents,Images,Musique,Video,Telechargements};
```

### E. Vérification
```bash
clear;
ls -ld /home/public/{Documents,Images,Musique,Video,Telechargements};
```

```
# drwxrwxrwt  2 root root 3 Jan 15 12:21 /home/public/Documents
# drwxrwxrwt 2 root root 2 Jan 15 12:20 /home/public/Images
# drwxrwxrwt 2 root root 2 Jan 15 12:20 /home/public/Musique
# drwxrwxrwt 2 root root 2 Jan 15 12:20 /home/public/Telechargeme
```
