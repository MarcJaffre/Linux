### A. Chercher une image
```bash
clear;
docker search alpine
```

### X. Télécharger une image
```bash
clear;
docker pull alpine;
```

### X. Dockerfile
```bash
clear;
nano Dockerfile;
```
```
# Image System
FROM alpine

# Mise a jour
RUN apk update && apk upgrade
```

### X. Construire l'image
```bash
clear;
docker build -f Dockerfile . -t alpine:0.1;
```
### X. Supprimer Image
```bash
clear;
docker image rm alpine:0.1
```
