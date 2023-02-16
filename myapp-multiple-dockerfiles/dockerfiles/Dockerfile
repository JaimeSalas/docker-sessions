FROM node:12-stretch 

WORKDIR /opt/app

COPY ./index.js . 
COPY ./*.json . 

RUN npm i --only=production

CMD ["npm", "start"]
