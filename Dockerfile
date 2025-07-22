# Based on https://hub.docker.com/layers/mosajjal/pproxy/latest-uv/images/sha256-f2a18b18f36bb590486bf1240757110edfe3c5aa8d6845c7c32d7ce12f36f3c6
# But I repackage the image to provide a fresh image continuously

FROM python:3.13.5@sha256:7175df81f9a313ee52286c94a5c35620d37afb31f9e05e47a3e058db84d53854

# renovate: datasource=pypi depName=pproxy
ENV PPROXY_VERSION=2.7.9

RUN pip3 install --no-cache-dir pproxy==${PPROXY_VERSION} pycryptodome asyncssh aioquic pvpn uvloop
ENTRYPOINT ["pproxy"]
