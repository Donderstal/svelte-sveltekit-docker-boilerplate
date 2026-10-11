ARG BUILD_TIME_VAR

# 1 - Dependencies stage
FROM node:24.0.0-alpine AS packages
WORKDIR /app
COPY package*.json ./
RUN npm ci

# 2 - Build stage
FROM node:24.0.0-alpine AS build
ARG BUILD_TIME_VAR
ENV BUILD_TIME_VAR=${BUILD_TIME_VAR}
WORKDIR /app

COPY --from=packages /app/node_modules ./node_modules
COPY . .
RUN npm run build

# Stage 3: Runtime
FROM nginx:alpine AS runtime
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/templates/default.conf.template

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]