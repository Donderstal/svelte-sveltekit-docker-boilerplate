# Dependencies stage
FROM node:24-alpine AS packages
WORKDIR /app
COPY package*.json ./
RUN npm ci

# Build stage
FROM node:24-alpine AS build
WORKDIR /app
COPY --from=packages /app/node_modules ./node_modules
COPY . .
RUN npm run build
RUN npm prune --omit=dev

# Runtime stage
FROM node:24-alpine AS runtime
WORKDIR /app
ENV NODE_ENV=production

# Create a non root user for the app
RUN addgroup -S -g 1001 sveltekit
RUN adduser -S -u 1001 -G sveltekit sveltekit

COPY --from=build --chown=sveltekit:sveltekit /app/build ./build
COPY --from=build --chown=sveltekit:sveltekit /app/node_modules ./node_modules
COPY --from=build --chown=sveltekit:sveltekit /app/package.json .

USER sveltekit
EXPOSE 3000
ENV PORT=3000
ENV HOST=0.0.0.0

CMD ["node", "build/index.js"]