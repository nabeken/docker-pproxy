# Based on https://hub.docker.com/layers/mosajjal/pproxy/latest-uv/images/sha256-f2a18b18f36bb590486bf1240757110edfe3c5aa8d6845c7c32d7ce12f36f3c6
# But I repackage the image to provide a fresh image continuously

FROM python:3.13.5
RUN pip3 install --no-cache-dir pproxy pycryptodome asyncssh aioquic pvpn uvloop
ENTRYPOINT ["pproxy"]
