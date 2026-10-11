ARG API_URL='default'

# Dependencies stage
FROM node:24-alpine AS packages
WORKDIR /app
COPY package*.json ./
RUN npm ci

# Build stage
FROM node:24-alpine AS build
ARG API_URL
ENV API_URL=${API_URL}
WORKDIR /app

COPY --from=packages /app/node_modules ./node_modules
COPY . .
RUN npm run build
RUN npm prune --omit=dev

# Runtime stage
FROM nginx:alpine AS runtime
WORKDIR /app
COPY --from=build /app/build/. /usr/share/nginx/html/