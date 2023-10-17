# ##### DEPENDENCIES
FROM node:19-alpine AS proddeps

WORKDIR /app
COPY . .

COPY package.json pnpm-lock.yaml pnpm-lock.yaml\* ./

RUN yarn global add pnpm
RUN pnpm i -P;


##### BUILDER
FROM node:19-alpine AS builder

WORKDIR /app
# COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN yarn global add pnpm
RUN pnpm i
RUN pnpm build


##### RUNNER
FROM --platform=linux/amd64 node:19-alpine AS runner
WORKDIR /app

ENV NODE_ENV production
ENV HTTPS true

COPY --from=proddeps /app/node_modules ./node_modules
COPY package.json pnpm-lock.yaml\* ./
COPY --from=builder /app/build ./build

EXPOSE 3000
ENV PORT 3000

CMD ["node", "build"]
