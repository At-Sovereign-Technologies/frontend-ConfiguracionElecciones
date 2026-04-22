# syntax=docker/dockerfile:1
FROM node:22-alpine AS build
WORKDIR /app

ARG VITE_API_GATEWAY_URL
ARG VITE_AUTHELIA_URL
ARG VITE_OIDC_CLIENT_ID
ARG VITE_OIDC_REDIRECT_URI

ENV VITE_API_GATEWAY_URL=$VITE_API_GATEWAY_URL
ENV VITE_AUTHELIA_URL=$VITE_AUTHELIA_URL
ENV VITE_OIDC_CLIENT_ID=$VITE_OIDC_CLIENT_ID
ENV VITE_OIDC_REDIRECT_URI=$VITE_OIDC_REDIRECT_URI

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
