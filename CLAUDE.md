# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository maintains a Docker image for [pproxy](https://github.com/qwj/python-proxy), a Python-based proxy server that supports HTTP, SOCKS4, and SOCKS5 protocols. The main purpose is to provide a fresh, up-to-date container image with the latest Python and pproxy versions.

## Architecture

The project is extremely simple with just two main files:
- `Dockerfile`: Defines the container image based on Python 3.13.5 with pproxy and related dependencies
- `README.md`: Contains basic usage instructions

## Common Commands

### Using Makefile (Recommended)
```bash
# Build the Docker image
make build

# Run the container interactively (requires SOCKS5 server)
make run SOCKS5_SERVER=socks5://your-server:1080
```

### Direct Docker Commands
```bash
# Build the Docker image
docker build -t local/pproxy:latest .

# Run the container interactively
docker run -it --rm -p 127.0.0.1:8080:8080 local/pproxy:latest -l http+socks5://:8080 -r socks5://socks5-server:1080 -v
```

### Testing the Image
```bash
# Test basic container functionality
docker run --rm local/pproxy:latest --help

# Test proxy functionality (requires external SOCKS5 server)
docker run -it --rm -p 127.0.0.1:8080:8080 local/pproxy:latest -l http+socks5://:8080 -r socks5://your-socks5-server:1080 -v
```

## Key Dependencies

The Docker image includes:
- `pproxy`: The main proxy server package
- `pycryptodome`: Cryptographic library for secure connections
- `asyncssh`: SSH client/server for async operations
- `aioquic`: QUIC protocol implementation
- `pvpn`: VPN-related functionality
- `uvloop`: High-performance event loop for asyncio

## CI/CD

The repository includes a GitHub Actions workflow (`.github/workflows/docker-build.yml`) that:
- Builds and pushes images to GitHub Container Registry (ghcr.io)
- Supports multi-platform builds (linux/amd64, linux/arm64)
- Runs on pushes to main, pull requests, and weekly schedule
- Uses GitHub's built-in caching for faster builds

### Using Pre-built Images
```bash
# Pull and run from GHCR
docker run -it --rm -p 127.0.0.1:8080:8080 ghcr.io/nabeken/docker-pproxy:latest -l http+socks5://:8080 -r socks5://socks5-server:1080 -v
```

## Development Notes

This is a packaging repository focused on maintaining an up-to-date Docker image. The actual proxy functionality is provided by the upstream `pproxy` package. Any changes should focus on:
- Keeping the Python base image current
- Updating pproxy and its dependencies
- Maintaining compatibility with the expected command-line interface