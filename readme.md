## Install Windows

Utilizar permisos administrador / client business

- https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
- `wsl --set-default-version 2`

## Summary

- cgroups
    - memory, blkio, CPU
- namespaces
    - workspaces
- Union FileSystem

## Images

> Una imagen de Docker es una plantilla de sólo lectura, con instrucciones para crear un contenedor de Docker.

```bash
docker pull <image>
```

- Dockerfile
    - `FROM` - Base Image
    - `RUN` 
    - `COPY`
    - `ADD` - Localizaciones remotas - https://......
    - `ENV` - valor por defecto de variables de entorno - override en tiempo de ejecución
    - `WORKDIR` 
    - `EXPOSE` - Metadata para definir en que puertos escucha nuestra APP
    - `ENTRYPOINT`
    - `CMD`
    - `USER`
    - `ARG` override en tiempo de build - puede estar declardo antes del `FROM`
    - `SHELL` - **sh** / bash, zsh, python 
    - `LABEL`


```Dockerfile
WORKDIR /a
WORKDIR b
WORKDIR c
RUN pwd 
# /a/b/c
```


> .dockerignore Ignore ficheros a copiar

> A Docker image is composed by other images called layers.

## Running Containers

```bash
docker -d --rm -p 8080:8080 -e MY_ENV="foo" <name_image> 
```

- `-d` modo detach
- `--rm` auto remove
- `-p` mapeo de puertos
- `-e` Varaibles de entorno

## RUN vs CMD vs ENTRYPOINT

Tanto CMD como RUN trabajan en dos formatos `SHELL` (/bin/sh -c executable) o `EXEC` (executable)

- **RUN** Ejecuta comandos y/o genera nuevas capas -> Instalización de software
- **CMD** Establece el comando por defecto o los parámetros para el comando por defecto -> override
- **ENTRYPOINT** configura el contenedor que se va a ejecutar como `executable`

|                            |        No ENTRYPOINT       | ENTRYPOINT exec_entry p1_entry | ENTRYPOINT ["exec_entry", "p1_entry"]          |
|:--------------------------:|:--------------------------:|--------------------------------|------------------------------------------------|
|           No CMD           |     error, not allowed     | /bin/sh -c exec_entry p1_entry |               exec_entry p1_entry              |
| CMD ["exec_cmd", "p1_cmd"] |       exec_cmd p1_cmd      | /bin/sh -c exec_entry p1_entry |       exec_entry p1_entry exec_cmd p1_cmd      |
| CMD ["p1_cmd", "p2_cmd"]   |        p1_cmd p2_cmd       | /bin/sh -c exec_entry p1_entry |        exec_entry p1_entry p1_cmd p2_cmd       |
|     CMD exec_cmd p1_cmd    | /bin/sh -c exec_cmd p1_cmd | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry /bin/sh -c exec_cmd p1_cmd |

## Networking

## Volumes

- `bind mount` -> El punto de montaje host
- `volume` -> Gestionado Docker
- `tmpfs` 

### Volumes Syntax

- `-v`
- `--mount`

```bash
docker run -d \
    --mount source=myvol,target=/app \
    nginx
```

```bash
docker run -d \
    -v myvol:/app \
    nginx
```

`--volumes-from`

```yml
version: '3.6'
services:
  cadvisor:
    privileged: true
    container_name: cadvisor
    build:
      context: ./cadvisor
      dockerfile: Dockerfile
      args:
        VERSION: "v0.44.0"
      cache_from:
        - golang:buster
        - alpine:latest
    command:
      - '--allow_dynamic_housekeeping=true'
      - '--housekeeping_interval=30s'
      - '--docker_only=true'
      - '--storage_duration=1m0s'
      - '--event_storage_age_limit=default=0'
      - '--event_storage_event_limit=default=0'
      - '--global_housekeeping_interval=30s'
      - '--disable_metrics=accelerator,cpu_topology,disk,memory_numa,tcp,udp,percpu,sched,process,hugetlb,referenced_memory,resctrl,cpuset,advtcp,memory_numa'
      - '--store_container_labels=false'
    restart: unless-stopped
    devices:
      - /dev/kmsg:/dev/kmsg
    expose:
      - 8080
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:rw
      - /sys:/sys:ro
      - /var/lib/docker/:/var/lib/docker:ro
      - /etc/machine-id:/etc/machine-id:ro
      - /var/run/docker.sock:/var/run/docker.sock

  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    ports:
      - 9090:9090
    command:
      - --config.file=/etc/prometheus/prometheus.yml
    volumes:
      - ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml
    depends_on:
      - cadvisor
```
