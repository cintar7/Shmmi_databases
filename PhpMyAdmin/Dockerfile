# Use the official phpMyAdmin image with the desired version
FROM phpmyadmin/phpmyadmin:5.2.1

# Set environment variables if needed

# You may not need to install additional dependencies or configure PHP error logging since it's already handled by the official phpMyAdmin image.

# Copy custom config file if needed
#COPY PhpMyAdmin/config.inc.php /etc/phpmyadmin/config.inc.php

# Expose port 80 (this is typically already exposed in the official image)
EXPOSE 80

# The phpMyAdmin official image comes with its own CMD instruction to start the server
CMD ["apache2-foreground"]