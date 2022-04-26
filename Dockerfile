# Specify base image

FROM node:16-alpine as builder
WORKDIR '/app'

# copy package.json
COPY package.json .

# Install some dependencies
RUN npm install

# Now Copy any changed files
COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

