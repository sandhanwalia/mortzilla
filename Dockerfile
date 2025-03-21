# Build stage
FROM node:18 as build-stage

WORKDIR /app
COPY package*.json ./
COPY vite.config.js ./
COPY tailwind.config.js ./
COPY postcss.config.js ./
COPY resources/ ./resources/
COPY public/ ./public/

# Set production environment but ensure dev dependencies are installed for build
# This is important for blue-green deployment to ensure assets are built correctly
ENV NODE_ENV=development
ENV VITE_APP_ENV=production

# Install dependencies and build
RUN npm ci
RUN npm run build
RUN ls -la public/build/
RUN ls -la public/build/.vite/ || echo ".vite directory not found"
RUN cat public/build/.vite/manifest.json || echo "Manifest not found in .vite directory!"

# Copy the manifest from .vite directory to where Laravel expects it
# This ensures the application works correctly in both blue and green environments
RUN if [ -f "public/build/.vite/manifest.json" ]; then \
    cp public/build/.vite/manifest.json public/build/manifest.json; \
    echo "Copied manifest from .vite directory"; \
    fi

# Production stage
FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    nginx \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    sqlite3 \
    libsqlite3-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd pdo_sqlite

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy the application
COPY . .

# Copy built assets from build stage - ensure the entire build directory is copied
# This is critical for blue-green deployment to have consistent assets
COPY --from=build-stage /app/public/build /var/www/html/public/build

# Create SQLite database and set permissions
RUN mkdir -p database
RUN touch database/database.sqlite
RUN chown -R www-data:www-data /var/www/html/database
RUN chmod -R 775 /var/www/html/database
RUN chmod 664 database/database.sqlite

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Set final permissions
RUN chown -R www-data:www-data /var/www/html/storage \
    /var/www/html/bootstrap/cache \
    /var/www/html/public/build

RUN chmod -R 775 /var/www/html/storage \
    /var/www/html/bootstrap/cache \
    /var/www/html/public/build

# Configure PHP and Nginx
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY docker/php.ini /usr/local/etc/php/conf.d/app.ini
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

# Add to your Nginx configuration
RUN echo "add_header 'Access-Control-Allow-Origin' 'https://mortzilla.com' always;" >> /etc/nginx/conf.d/default.conf
RUN echo "add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS' always;" >> /etc/nginx/conf.d/default.conf
RUN echo "add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range' always;" >> /etc/nginx/conf.d/default.conf

# Start script
COPY docker/start.sh /start.sh
RUN chmod +x /start.sh

ENV PORT=8080
EXPOSE 8080

CMD ["/start.sh"]