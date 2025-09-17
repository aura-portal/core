# Template

## Details

What is this?

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop)

## Usage

```yaml
# docker-compose.yaml
---
services:
  proxy:
    image: ghcr.io/aura-portal/proxy:v0
    ports:
      - 80:80
  # core and module config
```

## Development

```shell
docker compose up
```
