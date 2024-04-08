# Minimal Golang Debug with Delve

This is a minimal example to debug any dockerized golang application using Delve and Visual Studio Code.

## Check this files

In order to see what you need to debug your dockerized golang application check this files:

- Dockerfile
- docker-compose.yaml
- lauch.json

_special comment on lauch.json, in specific the substitutePath configuration. This configuration subtitute the absolute path to the files in your machine to the absolute path in docker container_