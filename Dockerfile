# Based on https://hub.docker.com/layers/mosajjal/pproxy/latest-uv/images/sha256-f2a18b18f36bb590486bf1240757110edfe3c5aa8d6845c7c32d7ce12f36f3c6
# But I repackage the image to provide a fresh image continuously

FROM python:3.13.6@sha256:b3e52dd22ff14e2e6dcbc0f028f743dc037c74258e9af3d0a2fd8e6617d94d72

# renovate: datasource=pypi depName=pproxy
ENV PPROXY_VERSION=2.7.9

RUN pip3 install --no-cache-dir pproxy==${PPROXY_VERSION} pycryptodome asyncssh aioquic pvpn uvloop
ENTRYPOINT ["pproxy"]
