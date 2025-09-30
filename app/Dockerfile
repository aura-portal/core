FROM node:22-alpine AS base

RUN adduser -D aura

WORKDIR /home/aura

USER aura

FROM base AS builder

COPY --chown=aura:aura ./module/package.json ./module/package-lock.json ./

RUN npm install

COPY --chown=aura:aura ./module ./

RUN npm run build

FROM base

COPY --from=builder /home/aura/build ./
COPY --from=builder /home/aura/package.json ./
COPY --from=builder /home/aura/node_modules ./node_modules

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD wget --quiet --spider http://localhost:3000 || exit 1

EXPOSE 3000

CMD ["node", "index.js"]
