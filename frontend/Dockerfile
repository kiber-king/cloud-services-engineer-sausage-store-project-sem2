FROM node:8 AS build

WORKDIR /app
COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build \
    && mkdir -p /tmp/static \
    && first_dir="$(find dist -mindepth 1 -maxdepth 1 -type d | head -n 1)" \
    && if [ -n "$first_dir" ]; then cp -r "$first_dir"/. /tmp/static/; else cp -r dist/. /tmp/static/; fi

FROM nginx:1.27-alpine

COPY --from=build /tmp/static/ /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]