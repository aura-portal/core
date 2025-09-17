FROM node:22-alpine AS base

WORKDIR /module

FROM base AS builder

COPY ./module/package.json ./module/package-lock.json ./

RUN npm install

COPY ./module .

RUN npm run build

FROM base

COPY --from=builder /module/build /module
COPY --from=builder /module/package.json /module
COPY --from=builder /module/node_modules /module/node_modules

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD wget --quiet --spider http://localhost:3000 || exit 1

EXPOSE 3000

CMD ["node", "index.js"]
