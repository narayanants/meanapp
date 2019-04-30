FROM node:10.15.3-alpine
LABEL maintainer="Narayanan Ts <anawsguru@gmail.com>"
RUN apk add --update nodejs
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . . 
EXPOSE 5000
CMD npm start
VOLUME [ "/usr/src/app" ]

