# Étape de construction
FROM node:16.14.0-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install -g @angular/cli@15 || true
COPY . .
RUN npm run build || true


# Étape de production
FROM nginx:latest AS ngi
COPY . .
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 4200