## docker-pproxy

[![Build and Push Docker Image](https://github.com/nabeken/docker-pproxy/actions/workflows/docker-build.yml/badge.svg?branch=main)](https://github.com/nabeken/docker-pproxy/actions/workflows/docker-build.yml)

This is a repository to provide a fresh up-to-date [pproxy](https://github.com/qwj/python-proxy) container image.

## How To Run

```console
docker run -it --rm -p 127.0.0.1:8080:8080 ghcr.io/nabeken/docker-pproxy:latest -l http+socks5://:8080 -r socks5://socks5-server:1080 -v
```
