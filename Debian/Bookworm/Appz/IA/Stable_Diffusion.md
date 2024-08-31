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
cd $HOME;
rm -rf ~/Documents/Stable-diffusion 2>/dev/null;
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git ~/Documents/Stable-diffusion 2>/dev/null;
mkdir -p ~/Documents/Stable-diffusion/log
```

#### 4. Préparation Environnement
```bash
clear;
cd ~/Documents/Stable-diffusion;
python3 -m venv venv;
source venv/bin/activate;
python3 -m pip install --upgrade pip wheel;
bash webui.sh;
```

` Cannot locate TCMalloc. Do you have tcmalloc or google-perftool installed on your system? (improves CPU memory usage)` 

#### 5. Configuration de Stable-diffusion (AMD)
```bash
clear;
sed -i -e 's/\#export COMMANDLINE_ARGS\=\"\"/export COMMANDLINE_ARGS\=\"--skip-torch-cuda-test --precision full --no-half\"/g'                 ~/Documents/Stable-diffusion/webui-user.sh;
sed -i -e '/^export COMMANDLINE_ARGS=*/a export PYTORCH_HIP_ALLOC_CONF="garbage_collection_threshold:0.6,max_split_size_mb:128\"'              ~/Documents/Stable-diffusion/webui-user.sh;
sed -i -e '/^export PYTORCH_HIP_ALLOC_CONF\=.*/a export PYTORCH_CUDA_ALLOC_CONF\=\"garbage_collection_threshold\:0.6,max_split_size_mb:128\"'  ~/Documents/Stable-diffusion/webui-user.sh;
```

#### 6. SystemD
```bash
clear;
echo "[Unit]
Description=Stable Diffusion AUTOMATIC1111 Web UI service
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
User=marc
ExecStart=/usr/bin/env bash /home/marc/Documents/Stable-diffusion/webui.sh
StandardOutput=append:/home/marc/Documents/Stable-diffusion/log/OK.log
StandardError=append:/home/marc/Documents/Stable-diffusion/log/KO.log

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/stable_diffusion.service;
```

#### 7. Gestion du service
```bash
clear;
systemctl daemon-reload;
systemctl disable --now stable_diffusion.service;
systemctl restart stable_diffusion.service;
systemctl status  stable_diffusion.service;
systemctl enable  --now stable_diffusion.service;
```

#### 8. Journal d'événement
```bash
tail -f /home/marc/Documents/Stable-diffusion/log/*.log;
```

#### 9. Panel Web
```bash
http://127.0.0.1:7860
``` 

<br />

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## II. Complément
### A. XSarchitectural-12NightMoonsci-fi (civitai.com) | 36 Mo
```bash
clear;
wget https://civitai.com/api/download/models/30627 -O ~/Documents/Stable-diffusion/models/Lora/XSarchitectural-12NightMoonsci-fi.safetensors;
```

### B. Coyote (Kemono Friends) (civitai.com) | 2 Go
```bash
clear;
wget https://civitai.com/api/download/models/4980 -O ~/Documents/Stable-diffusion/models/Lora/Sci-Fi_Diffusion_v1.0.safetensors;
```

### C. Furry Girl (civitai.com) | 73 Mo
```bash
clear;
wget https://civitai.com/api/download/models/24691 -O ~/Documents/Stable-diffusion/models/Lora/Furry-girl.safetensors;
```

### D. Sevens Mix [Furry Model] (civitai.com) | 2 Go
```bash
clear;
wget https://civitai.com/api/download/models/13268 -O ~/Documents/Stable-diffusion/models/Stable-diffusion/sevens-mix-furry-model.safetensors;
```

### E. Autres
```bash
clear;
wget "https://civitai.com/api/download/models/540181?type=Model&format=SafeTensor&token=b5eb9a6bab84491d049bfa7a5a7fe004"

```


