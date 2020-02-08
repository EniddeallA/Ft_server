# INSTALL & UPDATE
apt-get update
apt-get install -y wget
apt-get install -y nginx
apt-get install -y mariadb-server
apt-get install -y php
apt-get install -y php-cli php-fpm php-cgi
apt-get install -y php-mysql
apt-get install -y php-mbstring
apt-get install -y openssl
apt-get install -y zip

# WORDPRESS
unzip /var/www/wordpress.zip -d /var/www/

# MYSQL
service mysql start
mysql < /var/www/init.sql
mysql wordpress -u root --password=  < /var/www/wordpress.sql

#PHPMYADMIN
cd
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
mkdir /var/www/wordpress/phpmyadmin/
tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/wordpress/phpmyadmin/
cp /var/www/config.inc.php /var/www/wordpress/phpmyadmin/

# LINK SITE
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
chmod -R 755 /var/www/*

# SSL
mkdir ~/mkcert && \
  cd ~/mkcert && \
  wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64 && \
  mv mkcert-v1.1.2-linux-amd64 mkcert && \
  chmod +x mkcert
./mkcert -install
./mkcert localhost

# ***mF6U%azX2n^#CmV