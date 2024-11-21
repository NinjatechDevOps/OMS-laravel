# Use the official PHP 8.1 FPM image as the base image
FROM php:8.1-fpm

# Set the working directory inside the container
WORKDIR /var/www

# Install dependencies for PHP and Composer
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    curl \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    gnupg \
    && apt-get clean

# Install Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
    gd \
    exif \
    mbstring \
    pdo \
    pdo_mysql \
    mysqli \
    intl \
    bcmath \
    opcache \
    soap \
    zip \
    pcntl \
    && docker-php-ext-enable exif

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www
RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]