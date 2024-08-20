
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## III. Subscription
### A. Panel de subscription
```
https://access.redhat.com/management/subscriptions
```

### B. Information sur la licence 

![image](https://github.com/Drthrax74/Linux/assets/35907/6e19cbba-53d4-4080-9fd9-031e2ab01e51)

![image](https://github.com/Drthrax74/Linux/assets/35907/5dfc59a0-6cf0-48f0-9e64-39ba6b6f2e3f)

<br />

### C. Gestionnaire de licence
#### 1. Etat de l'inscription à Redhat
```bash
subscription-manager list --available
```

![image](https://github.com/Drthrax74/Linux/assets/35907/0470b4fb-c91b-4315-8153-723d59bd3eac)

<br />

#### 2. Inscrire la machine à Redhat
```bash
subscription-manager register
subscription-manager register --username <Identifiant de connexion> --password <PASSWORD> --auto-attach
subscription-manager register --username <EMAIL> --password <PASSWORD> --auto-attach
```

![image](https://github.com/Drthrax74/Linux/assets/35907/28a31abf-9b3d-4343-8f6d-ebf8c3843e58)

![image](https://github.com/Drthrax74/Linux/assets/35907/8e9c4451-d45b-400a-b52e-b21f20ef944b)

![image](https://github.com/Drthrax74/Linux/assets/35907/8a14e45c-0ea4-4f7a-a671-d11a2e6234f0)

<br />

#### 3. Rafraichir
```bash
subscription-manager refresh
```

#### 4. Ajouter le système à une licence spécifique (Pool)
```bash
subscription-manager attach --pool=2c94738b8e14af59018e1af216be07bc
```
![image](https://github.com/Drthrax74/Linux/assets/35907/0f88a8e5-b5dd-4227-aeef-2b7cd05116e6)

<br />

#### 5. Désinscrire une licence
```bash
subscription-manager unregister
```

![image](https://github.com/Drthrax74/Linux/assets/35907/b129de62-13be-4bef-84a5-70228dfb585f)
