FROM node:18

RUN mkdir -p /home/apps/miapp

WORKDIR /home/apps/miapp

COPY /miapp/package.json /home/apps/miapp/package.json

COPY /miapp/src /home/apps/miapp/src

COPY /miapp/public /home/apps/miapp/public

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]