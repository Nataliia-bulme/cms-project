FROM ghost:6-alpine

# Рабочая директория Ghost
WORKDIR /var/lib/ghost

# Установить драйвер Postgres
RUN npm install pg --save --legacy-peer-deps

# Копируем кастомный контент (темы, изображения и т. д.)
COPY ./content ./content

COPY config.production.json /var/lib/ghost/config.production.json

# Настройки для подключения к Postgres
ENV database__client=postgres
ENV database__connection__host=${DB_HOST}
ENV database__connection__port=5432
ENV database__connection__user=${DB_USER}
ENV database__connection__password=${DB_PASSWORD}
ENV database__connection__database=${DB_NAME}

# URL сайта (обязательно совпадает с Render-доменом)
ENV url=https://cms-project-udv9.onrender.com

# Ghost работает на порту 2368
EXPOSE 2368

# Запуск Ghost
CMD ["node", "current/index.js"]

