FROM ubuntu:20.04

# Install Apache and PHP
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy a custom index.html file
COPY index.html /var/www/html/index.html

EXPOSE 80

# Start Apache
CMD ["apachectl", "-D", "FOREGROUND"]

