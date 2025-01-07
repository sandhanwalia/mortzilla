# Use a smaller base image
FROM ubuntu:22.04

# Set environment variables
ENV APPPATH=/var/www

# Set working directory
WORKDIR ${APPPATH}

# Update, upgrade, and install all necessary dependencies in one layer
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt update -y && \
    apt upgrade -y && \
    apt install -y rsync openssh-client curl zip unzip wget software-properties-common && \
    add-apt-repository -y ppa:ondrej/nginx && \
    add-apt-repository -y ppa:ondrej/php && \
    apt update && \
    apt -y install php8.3 php8.3-fpm build-essential libpng-dev libfreetype6-dev locales zip jpegoptim optipng pngquant gifsicle vim unzip git curl php8.3-gd php8.3-intl php8.3-mysql php8.3-mbstring php8.3-xml php8.3-curl php8.3-common php8.3-cli php8.3-bcmath php8.3-zip php8.3-pgsql php8.3-redis nginx supervisor pdftk cron php8.3-imagick && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Configure nginx to run in the foreground
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Configure Nginx
RUN rm /etc/nginx/sites-enabled/default
COPY nginx/dev /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/dev /etc/nginx/sites-enabled/dev

# Configure PHP
# COPY ./php/local.ini /usr/local/etc/php/conf.d/local.ini
# Copy the PHP local.ini configuration to both FPM and CLI directories
COPY ./php/local.ini /etc/php/8.3/fpm/conf.d/local.ini
COPY ./php/local.ini /etc/php/8.3/cli/conf.d/local.ini

# Copy the contents of the 'supervisor' directory to the '/etc/supervisor/conf.d/' directory
COPY supervisor/ /etc/supervisor/conf.d/

# Copy the composer.json and composer.lock files to the working directory.
COPY composer.json composer.lock ./

# Copy the entire application code to the working directory.
COPY . .

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Change ownership of our applications
# Change ownership of /var/www to www-data user and group
# Set permissions to 755 (read and execute for everyone, write for owner) for /var/www/storage
# Set permissions to 755 (read and execute for everyone, write for owner) for /var/www/bootstrap/cache
# Set permissions to 777 (read, write, and execute for everyone) for /var/www/storage
# Set permissions to 777 (read, write, and execute for everyone) for /var/www/bootstrap/cache
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www/storage \
    && chmod -R 755 /var/www/bootstrap/cache

# Install Laravel dependencies
RUN composer install --no-dev --optimize-autoloader

# Add the cron job
# Create the directory for crontabs
RUN mkdir -p /run/php
RUN echo "extension=imagick.so;" >> /etc/php/8.3/cli/php.ini
# Add a cron job
RUN (crontab -l 2>/dev/null; echo "* * * * * cd /var/www && php artisan schedule:run >> /dev/null 2>&1") | crontab -

# Start php-fpm and nginx server
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
