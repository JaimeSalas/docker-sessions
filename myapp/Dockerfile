FROM node:alpine 

WORKDIR /opt/app

COPY . .

# compile....

RUN npm i --only=production

EXPOSE 8080 

CMD npm start
