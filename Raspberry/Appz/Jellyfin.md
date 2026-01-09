---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## <p align='center'> Installation Jellyfin </p>
### Bash Générique
```bash
clear;
curl -s https://repo.jellyfin.org/install-debuntu.sh | bash
```


```
###########
services: #
###########
#
##############################################################
# Jellyfin: (root:users)                                     #
##############################################################
 Jellyfin:                                                   #
  # -------------------------------------------------------- #
  image: 'linuxserver/jellyfin:arm64v8-latest'               #
  #platform: 'linux/arm64'                                   #
  # -------------------------------------------------------- #
  container_name: 'Jellyfin2'                                #
  network_mode: 'bridge'                                     #
  restart: 'unless-stopped'                                  #
  # -------------------------------------------------------- #
  hostname: 'PI5'                                            #
  # -------------------------------------------------------- #
  group_add:                                                 #
   - '44'                                                    # Video
   - '105'                                                   # Render
  # -------------------------------------------------------- #
  cpus: '2.00'                                               # 0.50
  cpuset: '0,1'                                              #
  mem_limit: '2048m'                                         # 756-1024
  memswap_limit: '0m'                                        #
  # -------------------------------------------------------- #
  blkio_config:                                              #
     # ----------------------------------------------------- #
     device_read_bps:                                        #
       # --------------------------------------------------- #
       - path: /dev/nvme0n1                                  # Debian
         rate: 104857600                                     # 100 MB/s
       # --------------------------------------------------- #
       - path: /dev/sda                                      # Data
         rate: 52428800                                      # 50 MB/s (50*1024*1024)
       # --------------------------------------------------- #
       - path: /dev/sdb                                      # Vostfr
         rate: 52428800                                      # 50 MB/s
       # --------------------------------------------------- #
       - path: /dev/sdc                                      # Media
         rate: 52428800                                      # 50 MB/s
     # ----------------------------------------------------- #
     device_write_bps:                                       #
       # --------------------------------------------------- #
       - path: /dev/nvme0n1                                  #
         rate: 52428800                                      # 50 MB/s
       # --------------------------------------------------- #
       - path: /dev/sda                                      #
         rate: 20971520                                      # 20 MB/s
       # --------------------------------------------------- #
       - path: /dev/sdb                                      #
         rate: 20971520                                      # 20 MB/s
       # --------------------------------------------------- #
       - path: /dev/sdc                                      #
         rate: 20971520                                      # 20 MB/s
     # ----------------------------------------------------- #
     device_read_iops:                                       #
       # --------------------------------------------------- #
       - path: /dev/sda                                      #
         rate: 1000                                          #
       # --------------------------------------------------- #
       - path: /dev/sdb                                      #
         rate: 1000                                          #
       # --------------------------------------------------- #
       - path: /dev/sdc                                      #
         rate: 1000                                          #
       # --------------------------------------------------- #
     # ----------------------------------------------------- #
     device_write_iops:                                      #
       # --------------------------------------------------- #
       - path: /dev/sda                                      #
         rate: 500                                           #
       # --------------------------------------------------- #
       - path: /dev/sdb                                      #
         rate: 500                                           #
       # --------------------------------------------------- #
       - path: /dev/sdc                                      #
         rate: 500                                           #
       # --------------------------------------------------- #
     # ----------------------------------------------------- #  
  # -------------------------------------------------------- #
  environment:                                               #
   # ------------------------------------------------------- #
   TZ: 'Europe/Paris'                                        #
   PUID: '0'                                                 #
   PGID: '100'                                               #
   # ------------------------------------------------------- #
   DOCKER_MODS: 'ghcr.io/gilbn/theme.park:jellyfin'          #
   TP_THEME: 'dracula'                                       #
   # ------------------------------------------------------- #
   JELLYFIN_PublishedServerUrl: 'http://192.168.1.105:8096'  #
   JELLYFIN_WebDir: '/config/www'                            #
   JELLYFIN_STARTUP_ARGS: '--noautorun'                      #
   JELLYFIN_DISABLE_AUTO_SCAN: 'true'                        #
   JELLYFIN_SUPPRESSAUTOUPDATE: 'true'                       #
   # ------------------------------------------------------- #
   JELLYFIN_FFMPEG_THREADS: '2'                              #
   JELLYFIN_TRANSCODING_TEMP_PATH: '/tmp'                    #
   UMASK: '022'                                              #
   # ------------------------------------------------------- #
   #V4L2_DEVICE: '/dev/video0'                               #
   #NVIDIA_DRIVER_CAPABILITIES: 'all'                        # Fix V4L2 init
   #LIBVA_DRIVER_NAME: 'iHD'                                 #
  # -------------------------------------------------------- #
  devices:                                                   #
   # ------------------------------------------------------- #
   - '/dev/video0:/dev/video0'                               # HEVC
   - '/dev/media1:/dev/media1'                               # HEVC decoder
   - '/dev/dri:/dev/dri'                                     # 
  # -------------------------------------------------------- #
  ports:                                                     #
   - '8098:8096'                                             #
  # -------------------------------------------------------- #
  volumes:                                                   #
   # ------------------------------------------------------- # /srv/dev-disk-by-uuid-722a5e39-56b6-453f-b727-7d672707bed2/Data/Docker/volumes/Jellyfin2/config/fonts
   - "$DOCKER_VOL/Jellyfin2/config:/config"                  # BACKUP
   - "$DOCKER_VOL/Jellyfin2/tmp:/tmp"                        # BACKUP
   - "$DOCKER_VOL/Jellyfin2/config/fonts:/config/fonts:ro"   # BACKUP
   # ------------------------------------------------------- #
   - "$MEDIA_1:/srv/Media_1:rw"                              # SKIP_BACKUP
   - "$MEDIA_2:/srv/Media_2:rw"                              # SKIP_BACKUP
   - "$MEDIA_3:/srv/Media_3:rw"                              # SKIP_BACKUP
   - "$VOSTFR:/srv/Media_3/Vostfr:rw"                        # SKIP_BACKUP
   # ------------------------------------------------------- #
   - "$MUSIC:/srv/Music:rw"                                  # SKIP_BACKUP
   - "$FORMATION:/srv/Formation:ro"                          # SKIP_BACKUP
   - "$MYPHOTO:/srv/Photos:ro"                               # SKIP_BACKUP
  # -------------------------------------------------------- #
  healthcheck:                                               #
   test: ["CMD", "curl", "-f", "http://localhost:8096"]      #
   start_period: '15s'                                       #
   # ------------------------------------------------------- #
   timeout:   '3s'                                           #
   retries:   '3'                                            #
   interval: '120s'                                          #
##############################################################
#
#####################################################################
# encoding.xml                                                      #
# ----------------------------------------------------------------- #
# Accélérateur matériel : Video4Linux2                              #
# ----------------------------------------------------------------- #
# Activer le décodage matériel pour:                                #
# H264             					: ON        #
# ----------------------------------------------------------------- #
# Activer l'encodage matériel                           : OFF       #
# ----------------------------------------------------------------- #
# Autoriser l'encodage au format HEVC                   : ON        #
# Autoriser l'encodage au format AV1                    : OFF       #
# Nombre de threads de transcodage                      : 2         #
# ----------------------------------------------------------------- #
# Chemin du dossier de secours des polices              : /config/fonts #
# Activer les polices de secours                        : ON        #
# Activer l'encodage audio VBR                          : OFF       #
# ----------------------------------------------------------------- #
# Booster l'audio lors du rééchantillonnage             : 0.5       #
# Algorithme de rééchantillonnage en stéréo             : Aucun     #
# Taille maximale de la queue de multiplexage *         : 2048 Mo   #
# Profil d'encodage                                     : SuperFast #
# CRF d'encodage H265                                   : 28        #
# CRF d'encodage H264                                   : 40        #
# Méthode de désentrelacèrent                           : Yadif     #
# Multiplier par 2 la fréquence d'images ....           : OFF       #
# Autoriser l'extraction de sous titre ....             : OFF       #
# Réduire la vitesse du transcodage                     : OFF       #
# Supprimer les segments                                : OFF       #
# Limiter la vitesse après                              : 10        #
# Durée de conservation des segments                    : 3600      #
# ----------------------------------------------------------------- #
# *: Si la valeur est trop basse, le lecteur plante.                #
#    On remarquer dans Top GPU il plante.                           #
# ----------------------------------------------------------------- #
# Admin > User > Marc                                               #
# Limite de débit de streaming Internet (Mbps) 15                   #
# ----------------------------------------------------------------- #
# Dashboard > marc > Lecture :                                      #
# 1080p : 15 Mbps  → Force remux HEVC souvent                       #
# 720p  : 8 Mbps   → Transcodage fluide                             #
# 480p  : 2.5 Mbps → Fallback ultra-léger                           #
#####################################################################
```
