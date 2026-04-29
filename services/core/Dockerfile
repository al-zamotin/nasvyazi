FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git curl libpng-dev libonig-dev libxml2-dev libpq-dev libicu-dev zip unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install php extensions
RUN docker-php-ext-install pdo_pgsql mbstring exif pcntl bcmath gd intl \
    && pecl install redis \
    && docker-php-ext-enable redis

# Copy composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Setting work directory
WORKDIR /var/www/html

# Access rights
RUN chown -R www-data:www-data /var/www/html

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
