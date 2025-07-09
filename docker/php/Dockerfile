# Utilisation de l'image PHP 8.1 FPM comme base
FROM php:8.1-fpm

# Copier Composer depuis l'image officielle
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Installation des dépendances système et des extensions PHP pour PrestaShop
RUN apt-get update && apt-get install -y libzip-dev libicu-dev libpng-dev libjpeg-dev libwebp-dev libxml2-dev zlib1g-dev unzip git

# Modification de l'UID et GID de www-data pour correspondre à l'hôte
RUN groupmod -g 1000 www-data && usermod -u 1000 -g www-data www-data
 
RUN docker-php-ext-configure gd --with-jpeg --with-webp && docker-php-ext-install -j$(nproc) gd zip intl pdo pdo_mysql soap opcache

# Installation de Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Installation de mhsendmail pour Mailhog
RUN apt-get install -y golang-go && \
    go install github.com/mailhog/mhsendmail@latest && \
    cp /root/go/bin/mhsendmail /usr/bin/mhsendmail && \
    rm -rf /usr/local/go /root/go

# Définir l'utilisateur et le groupe de travail
WORKDIR /var/www/html
USER www-data

