chown -R www-data:www-data /var/www/*
service mysql restart
service nginx reload
service nginx start
# RUN PHP
service php7.3-fpm start
bash