FROM alpine:3.19

# Instalar dependencias
RUN apk update && apk add --no-cache \
    git \
    curl \
    chromium \
    harfbuzz \
    freetype \
    libx11 \
    nss

# Instalar Node.js 18
RUN apk add --no-cache nodejs \
    npm

# Establecer variables de entorno
ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# Establecer variables de entorno para Puppeteer
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
    
# Copiar el proyecto al contenedor
WORKDIR /app
COPY . .

# Instalar dependencias de npm
RUN npm install

# Exponer el puerto si es necesario (si tu aplicación lo requiere)
# EXPOSE 3000

# Comando por defecto
CMD ["npm", "run", "test:chrome"]

# Comando por defecto
# CMD ["chromium-browser", "--no-sandbox", "--headless", "--disable-gpu", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222"]
