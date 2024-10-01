FROM node:21.7
LABEL authors="jason"

WORKDIR /home/node/app
COPY app.js .
EXPOSE 8080
USER node
CMD ["node", "app.js"]