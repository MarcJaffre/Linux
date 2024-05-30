-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation du pilote graphique Nvidia </p>

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### I. Présentation
#### A. Identification du GPU
```bash
clear;
GPU=$(lspci | grep "VGA\|3D" | grep NVIDIA | cut -d " " -f 1)
lspci -vnk -s $GPU;
```

<br />

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### II. Installation de pilote
#### A. Pilote Libre

#### B. Pilote propriétaire
##### 1. En-tête du kernel
```bash
clear;
apt install linux-headers-$(uname -r);
```

##### 2. Nvidia-smi
```bash
clear;
 apt install -y --no-install-recommends --no-install-suggests nvidia-smi;
```
![image](https://github.com/MarcJaffre/Linux/assets/35907/0fad553a-a4ac-457b-b3ef-48b8acf4151f)


##### 3. 
```bash
nvidia-smi --query-gpu=gpu_name,gpu_uuid --format=csv
```
![image](https://github.com/MarcJaffre/Linux/assets/35907/a2c955ca-f89e-400b-af76-6e00f0f4d883)



##### 4. 
```bash
clear;
```
##### 5. 
```bash
clear;
```




kernel headers for this kernel do not seem to be installed.
