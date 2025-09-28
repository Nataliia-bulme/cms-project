FROM ghost:6-alpine

WORKDIR /var/lib/ghost

RUN npm install pg --save --legacy-peer-deps

COPY ./content ./content
COPY config.production.json ./config.production.json

ENV url=https://cms-project-udv9.onrender.com

EXPOSE 2368

CMD ["node", "current/index.js"]


