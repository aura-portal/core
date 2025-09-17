FROM alpine:3

RUN adduser -D aura

WORKDIR /home/aura

USER aura

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD exit 0
