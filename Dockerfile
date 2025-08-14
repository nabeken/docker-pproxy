# Based on https://hub.docker.com/layers/mosajjal/pproxy/latest-uv/images/sha256-f2a18b18f36bb590486bf1240757110edfe3c5aa8d6845c7c32d7ce12f36f3c6
# But I repackage the image to provide a fresh image continuously

FROM python:3.13.6@sha256:50cbf8e58ca53a806b99250b1ba2d16c19433e8c42e7eb4ac4ea924b095e280b

# renovate: datasource=pypi depName=pproxy
ENV PPROXY_VERSION=2.7.9

RUN pip3 install --no-cache-dir pproxy==${PPROXY_VERSION} pycryptodome asyncssh aioquic pvpn uvloop
ENTRYPOINT ["pproxy"]
