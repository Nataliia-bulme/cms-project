FROM ghost:6-alpine

WORKDIR /var/lib/ghost

# Установим зависимости проекта (включая pg)
COPY package.json package-lock.json* ./
RUN npm install --production

COPY ./content ./content
COPY config.production.json ./config.production.json

EXPOSE 2368

CMD ["node", "current/ghost.js"]

