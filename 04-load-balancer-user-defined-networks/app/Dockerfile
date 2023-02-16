FROM node:alpine 

WORKDIR /opt/app

COPY . .

RUN npm ci --only=production

ENV MESSAGE=build

EXPOSE 8080 

CMD npm start
