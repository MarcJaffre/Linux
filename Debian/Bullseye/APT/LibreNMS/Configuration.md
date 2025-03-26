------------------------------------------------------------------------------------------------------------------
# <p align='center'> Configuration de LibreNMS </p>
------------------------------------------------------------------------------------------------------------------
## I. Configuration de base
### A. Emplacement du fichier
```bash
clear;
nano /opt/librenms/config.php;
```
### B. TimeStamp
```
$config['alert_graph_date_format'] = 'd-m-Y H:i:s';
$config['dateformat.compact']      = 'd-m-Y H:i:s';
```

### C. Duplication de nom d'un équipement
Si l'équipement dispose de 2 lien internet qui seront supervisés, ceci est indispensable
```bash
$config['allow_duplicate_sysName'] = true;
```
