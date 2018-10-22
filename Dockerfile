FROM node:10-alpine

RUN npm install -g forever

WORKDIR /app

ADD package.json /app/package.json
RUN npm install

ADD app /app/app
ADD README.md /app/README.md

ONBUILD ADD config.json /app/app/config.json

EXPOSE 3000

CMD [ "forever","--watch", "--watchDirectory", "/app/app", "/app/app/app.js"]
