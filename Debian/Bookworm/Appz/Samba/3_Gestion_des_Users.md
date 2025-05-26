------------------------------------------------------------------------------------------------------------------
# <p align='center'> Gestions des utilisateurs </p>
------------------------------------------------------------------------------------------------------------------
## I. Gestion des utilisateurs Samba
### Lister les utilisateurs
```bash
pdbedit -L;
```

### Ajouter Utilisateur
```bash
smbpasswd -a <USERNAME>;
smbpasswd -a $(id -u -n 1000);
```

### Désactiver Utilisateur
```bash
smbpasswd -d <disable user>;
```

### Activer Utilisateur
```bash
smbpasswd -e <enable user>;
smbpasswd -e $(id -u -n 1000);
```

### Supprimer Utilisateur
```bash
smbpasswd -x <delete user>;
```

### Définir aucun mot de passe
```bash
smbpasswd -n <set no password>;
```
