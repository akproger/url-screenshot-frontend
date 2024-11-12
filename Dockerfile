# Используем официальный образ Node для сборки
FROM node:16 as build-stage

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем все остальные файлы
COPY . .

# Собираем проект
RUN npm run build

# Используем nginx для запуска приложения
FROM nginx:stable-alpine as production-stage

# Копируем сборку Vue в папку, которую обслуживает Nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Копируем кастомный конфигурационный файл nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Открываем порт 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
