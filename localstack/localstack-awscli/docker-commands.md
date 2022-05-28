# Docker Commands
---

## Find running containers
---
```bash
docker ps
```
```
CONTAINER ID   IMAGE                   COMMAND                  CREATED         STATUS         PORTS                                                                NAMES
d3c59c26fe43   localstack/localstack   "docker-entrypoint.sh"   6 minutes ago   Up 6 minutes   4567-4597/tcp, 8080/tcp, 0.0.0.0:8001->4566/tcp, :::8001->4566/tcp   mobility-lambda-08
```

## Execute command inside a container
---
```bash
docker exec -it $container_name ls /
```
```
bin    etc    lib    mnt    proc   run    srv    tmp    var
dev    home   media  opt    root   sbin   sys    usr
```

## Ports used by a container
---
```bash
docker port $container_name
```
```   
4566/tcp -> 0.0.0.0:8001
4566/tcp -> :::8001
```

## Log from a container
---
```bash
docker logs $container_name
```

## IP address of a container
---
```bash
docker inspect -f "{{ .NetworkSettings.IPAddress }}" $container_name
```
```
172.17.0.2
```

## Stop a container
---
```bash
docker stop $container_name
```

## Remove a container
---
```bash
docker rm $container_name
```

## Remove image
---
```bash
docker image rmi localstack/localstack
```
```
Untagged: localstack/localstack:latest
Deleted: sha256:9c9e48875b1fcff0269adb1017ea552756da4e225c94372e4ebce199168fb150
Deleted: sha256:eff7f158d7b5848849804e0ef678016adcbd2b7a1331109c87fc830348f383ab
```

## List images
---
```bash
docker images
```
```
REPOSITORY              TAG                  IMAGE ID       CREATED         SIZE
localstack/localstack   latest               9c9e48875b1f   15 months ago   648MB
lambci/lambda           20191117-python3.6   597a9e0accd0   2 years ago     867MB
```

# Docker-Compose Commands
---
## Start container(s) using `docker-compose.yml`
---
```bash
docker-compose up -d
```

## Remove container(s) using `docker-compose.yml`
---
```bash
docker-compose down
```
