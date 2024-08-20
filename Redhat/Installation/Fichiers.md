------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Présentation des fichiers de RedHat </p>

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation ([Understanding the various RHEL .iso files](https://access.redhat.com/solutions/104063))
#### X. boot.iso
```
Utilisé pour installer le système d'exploitation à partir d'une autre source (telle qu'un référentiel http des fichiers binaires).
Peut également être utilisé pour accéder au mode de sauvetage.
```

#### X. Binary DVD
```
Les disques requis pour installer et utiliser Red Hat Enterprise Linux.
Peut également être utilisé pour accéder au mode de secours.
```

#### X. WinSync Installer
```
Installateur de l'application WinSync, utilisée conjointement avec Red Hat Enterprise Linux pour synchroniser un Active Directory Windows Server.
```

#### X. Source DVD
```
Code source (instructions en langage de programmation lisibles par l'homme) pour Red Hat Enterprise Linux, fourni conformément à la licence publique générale GNU sous laquelle Red Hat Enterprise Linux est créé.
Il n'existe aucune documentation pour les DVD sources.
Ceux-ci peuvent être utilisés pour compiler ou développer votre propre logiciel basé sur la version Red Hat.
```


#### X. P2V ISO
```
Cette ISO est utilisée pour convertir votre système RHEL physique en un système RHEL virtuel.
```

#### X. KVM Guest Image
```
Vous pouvez utiliser une image qcow2 invité RHEL KVM prête, car ces images sont configurées avec cloud-init et doivent tirer parti des services de métadonnées compatibles ec2 pour le provisionnement des clés SSH afin de fonctionner correctement.
Pour plus d'informations, consultez le Guide de la plateforme Openstack
```

#### X. ISO Images for Older Releases
```
Versions mineures précédentes de Red Hat Enterprise Linux.
```
