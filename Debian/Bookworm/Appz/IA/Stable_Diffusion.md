------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Deploiement de l'IA Stable Diffusion </p>


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Installation
### A. Déploiement de stable diffusion
#### X. Dépendances
```bash
clear;
apt install -y git libgl1 libglib2.0-0 python3 python3-venv wget;
``` 
#### X. Téléchargement
```bash
clear;
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git ~/Documents/Stable-diffusion;
cd ~/Documents/Stable-diffusion;
```

#### X. Permission
```bash
clear;
chmod +x ./webui-macos-env.sh ./webui.sh ./webui-user.sh
```

### B. Lancement
```bash
clear;
cd ~/Documents/Stable-diffusion;
./webui.sh
``` 
### C.
### D.

### X. ERREURS
```
# ./webui.sh
cannot locate TCMalloc. do you have tcmallow or google-perftool installed on your systel ? (Improves CPU Memory Usage)
```
