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

docker build .
