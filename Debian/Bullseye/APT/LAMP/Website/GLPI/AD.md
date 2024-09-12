---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Authentification LDAP sur GLPI </p>


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Active-Directory
![image](https://github.com/Drthrax74/Linux/assets/35907/01974072-fb8e-464f-9d44-220cb73a987a)

![image](https://github.com/Drthrax74/Linux/assets/35907/aa194b59-c54c-4d99-ac07-6b10db55b5ab)

![image](https://github.com/Drthrax74/Linux/assets/35907/624080ac-d69d-4aea-8826-07185ff8bd4c)

![image](https://github.com/Drthrax74/Linux/assets/35907/6fc107d3-6b0a-4f97-9c13-a47ced6412ee)

#### B. Importation
##### 1. Groupe
On ne peut pas importer des Groupes sans utilisateur dedans.

![image](https://github.com/Drthrax74/Linux/assets/35907/fda24f15-9723-4e91-bb9e-010e0c993f61)

![image](https://github.com/Drthrax74/Linux/assets/35907/ccea6501-369d-490c-b46c-621c40f8e211)

![image](https://github.com/Drthrax74/Linux/assets/35907/f2f4665f-97b1-4c69-ac19-cef70de37591)

![image](https://github.com/Drthrax74/Linux/assets/35907/a6559a4f-be9d-4d3f-83c3-da343174396b)

![image](https://github.com/Drthrax74/Linux/assets/35907/c6917850-848d-4e5f-90ce-11f8428ade41)

![image](https://github.com/Drthrax74/Linux/assets/35907/9fa81c6c-671a-44a1-be1e-cbaaac4dc32b)

##### 2. Utilisateurs
![image](https://github.com/Drthrax74/Linux/assets/35907/68961de1-1d1c-4763-bc55-75d7bde8a589)

![image](https://github.com/Drthrax74/Linux/assets/35907/ff0ed860-58e5-4bbc-8dba-0c7bf9c201ff)

![image](https://github.com/Drthrax74/Linux/assets/35907/594c2be4-94b1-4a35-b8aa-56c0bc6fe1a6)

![image](https://github.com/Drthrax74/Linux/assets/35907/ba9ba6b8-3104-48a4-b250-558364ce51d4)

![image](https://github.com/Drthrax74/Linux/assets/35907/b979b2c1-010b-48bc-a32e-86850abea207)

![image](https://github.com/Drthrax74/Linux/assets/35907/4d1afd9c-6ddd-496b-9215-d3f05b3eb254)

#### C. Règles
![image](https://github.com/Drthrax74/Linux/assets/35907/c3811f32-6f4a-40fe-9b56-181f6caf31b8)

![image](https://github.com/Drthrax74/Linux/assets/35907/942b2333-1c46-41c1-ac22-ff1f3bf4f655)

![image](https://github.com/Drthrax74/Linux/assets/35907/991b0802-3f26-485e-a176-c726262aaf88)

![image](https://github.com/Drthrax74/Linux/assets/35907/564ce452-05ba-4a61-8221-2c237f0ed60f)

![image](https://github.com/Drthrax74/Linux/assets/35907/5751b9c1-e3d5-4364-963a-51b36c61c881)

##### D. Synchronisation
Aller dans Utilisateurs.

![image](https://github.com/Drthrax74/Linux/assets/35907/32accbb9-e1dc-44e2-96c8-2b4512769141)


```
echo "y" | /usr/bin/php7.4 /var/www/html/glpi/bin/console  glpi:ldap:synchronize_users -d 3
```
