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
    - `ENV` - valor por defecto de variables de entorno - override en timepo de ejecución
    - `WORKDIR` 
    - `EXPOSE` - Metadata para definir en que puertos escucah nuestra APP
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
