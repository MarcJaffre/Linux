------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Deploiement de l'IA Stable Diffusion </p>


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## I. Présentation

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Installation
### A. Déploiement de stable diffusion
#### 1. Dépendances
```bash
clear;
apt install -y git libgl1 libglib2.0-0 python3 python3-venv wget;
``` 
#### 2. Téléchargement
```bash
clear;
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git ~/Documents/Stable-diffusion;
cd ~/Documents/Stable-diffusion;
```
#### 3. Permission
```bash
clear;
chmod +x ./webui-macos-env.sh ./webui.sh ./webui-user.sh
```
#### 4. Configuration (AMD)
```bash
sed -i -e 's/#export COMMANDLINE_ARGS=""/export COMMANDLINE_ARGS="--skip-torch-cuda-test"/g' ./webui-user.sh;
sed -i -e 's///g' ./webui-user.sh;
sed -i -e 's///g' ./webui-user.sh;
sed -i -e 's///g' ./webui-user.sh;


# no module 'xformers'. Processing without...
# Warning: caught exception 'No HIP GPUs are available', memory monitor disabled
```




### C. Lancement
```bash
clear;
cd ~/Documents/Stable-diffusion;
./webui.sh
``` 


### D. Panel Web
```
http://127.0.0.1:7860
```

### X. Amélioration
```
# ./webui.sh
cannot locate TCMalloc. do you have tcmallow or google-perftool installed on your systel ? (Improves CPU Memory Usage)
```
