FROM ubuntu
FROM node:20-alpine3.17
LABEL maintainer="Narayanan Ts <anawsguru@gmail.com>"
RUN apk -u add vim
RUN apk add --update nodejs
ENV NODE_ENV production
WORKDIR /app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . . 
EXPOSE 2000
CMD npm start
VOLUME [ "/app" ]

