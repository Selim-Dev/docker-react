FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN  npm install
COPY . .
RUN npm run build

FROM  nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# we don't have to specify nginx  command because the default command will start the nginx 
