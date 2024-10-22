# Use the official PHP image with Apache
FROM php:8.1-apache

# Install any necessary PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy your PHP application to the container
COPY . /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Set permissions (optional, adjust as necessary)
RUN chown -R www-data:www-data /var/www/html

# Expose the port that Apache is listening on
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
