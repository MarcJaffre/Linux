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
FROM alpine
RUN apk update
RUN apk upgrade
```


### X. Construire l'image
```bash
clear;
docker build -f Dokerfile . -t Alpine:0.1;
```
