FROM node:22-alpine AS base

RUN adduser -D aura

USER aura

WORKDIR /home/aura/app

FROM base AS builder

COPY --chown=aura:aura ./app/package*.json ./app/svelte.config.js ./

RUN npm install

COPY --chown=aura:aura ./app ./

RUN npm run build

FROM base

COPY --from=builder /home/aura/app/build ./
COPY --from=builder /home/aura/app/package.json ./
COPY --from=builder /home/aura/app/node_modules ./node_modules

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD wget --quiet --spider http://localhost:3000 || exit 1

EXPOSE 3000

CMD ["node", "index.js"]
