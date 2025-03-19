#!/bin/sh

# Enable PHP error logging
echo "display_errors = On" >> /usr/local/etc/php/php.ini
echo "log_errors = On" >> /usr/local/etc/php/php.ini
echo "error_log = /dev/stderr" >> /usr/local/etc/php/php.ini

# Generate application key if not set
if [ -z "$APP_KEY" ]; then
    php artisan key:generate
fi

# Run database migrations
php artisan migrate --force

# Clear cache and optimize
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

# Debug Vite manifest
echo "Checking for Vite manifest..."
ls -la /var/www/html/public/build/ || echo "Build directory not found or empty"

# If manifest doesn't exist, try to create a basic one
if [ ! -f "/var/www/html/public/build/manifest.json" ]; then
    echo "Manifest not found, creating a basic one..."
    mkdir -p /var/www/html/public/build/assets
    
    # Create placeholder asset files if they don't exist
    touch /var/www/html/public/build/assets/app-DFS21Hri.js
    touch /var/www/html/public/build/assets/app-DO6MCP1W.css
    
    # Create a basic manifest file with correct file paths
    cat > /var/www/html/public/build/manifest.json << 'EOF'
{
  "resources/js/app.js": {
    "file": "assets/app-DFS21Hri.js",
    "isEntry": true,
    "src": "resources/js/app.js"
  },
  "resources/css/app.css": {
    "file": "assets/app-DO6MCP1W.css",
    "isEntry": true,
    "src": "resources/css/app.css"
  }
}
EOF

    # Update file permissions
    chown -R www-data:www-data /var/www/html/public/build
    chmod -R 775 /var/www/html/public/build
    
    echo "Created basic manifest file"
    ls -la /var/www/html/public/build/
fi

# Start PHP-FPM
php-fpm -D

# Replace PORT in Nginx config
sed -i "s/\$PORT/$PORT/g" /etc/nginx/conf.d/default.conf

# Start Nginx with debug mode
nginx -g 'daemon off; error_log /dev/stderr debug;' 