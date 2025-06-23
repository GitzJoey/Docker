FROM node:latest

RUN \
  apt-get update -y && \
  apt-get upgrade -y

RUN \
  chown -R node:node /home/node/

WORKDIR /home/node/

USER node

RUN \
  git clone https://github.com/GitzJoey/MSEdgeSearchClicker && \
  cd MSEdgeSearchClicker && \
  npm install

CMD cd /home/node/MSEdgeSearchClicker; npm run dev -- --host

EXPOSE 5173
