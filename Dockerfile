FROM ghost:6-alpine

WORKDIR /var/lib/ghost

# RUN npm install pg

COPY ./content ./content
COPY config.production.json /var/lib/ghost/config.production.json

ENV url=https://cms-project-udv9.onrender.com

EXPOSE 2368

CMD ["node", "current/ghost.js"]


