# Creating a docker image and Initializing a new build stage with debian 
# buster (the current stable debian 10 distribution) 
FROM debian:buster

EXPOSE 80 443

RUN echo '\e[36m\e[1m============ STARTING ============\e[0m'

RUN echo '\e[36m\e[1m============ SETTING UP DEBIAN ============\e[0m'
RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install wget vim curl zip unzip 

RUN echo '\e[36m\e[1m============ NGINX ============\e[0m'
RUN apt-get -y install nginx
COPY srcs/default /etc/nginx/sites-available/default

#####
RUN echo '\e[36m\e[1m============ PHP ============\e[0m'
RUN apt-get install -y  php7.3-cli php7.3-fpm php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath php7.3-json 
#####

######
RUN echo '\e[36m\e[1m============ WORDPRESS ============\e[0m'
RUN echo '\e[36m\e[1m============ REQUIREMENTS ============\e[0m'
RUN apt-get -y install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
RUN echo '\e[36m\e[1m============ INSTALLING = ===========\e[0m'
RUN wget https://wordpress.org/latest.tar.gz -P /tmp
RUN mkdir /var/www/html/wp
RUN tar xzf /tmp/latest.tar.gz --strip-components=1 -C /var/www/html/wp
########

#######
RUN echo '\e[36m\e[1m============ MYSQL ============\e[0m'

#######

#######
RUN echo '\e[36m\e[1m============ EXPOSE ============\e[0m'
#EXPOSE 443

#######

COPY srcs /
CMD bash start.sh
