# Creating a docker image and Initializing a new build stage with debian 
# buster (the current stable debian 10 distribution) 
FROM debian:buster
RUN echo '\e[36m\e[1m============ STARTING ============\e[0m'

# 'RUN' instruction let's you execute a command in a new container. If the command was previously run the
#    cache is used to retrieve it (persistence)

RUN echo '\e[36m\e[1m============ UPDATING ============\e[0m'
RUN apt-get update
RUN apt-get -y upgrade

#####
RUN echo '\e[36m\e[1m============ REQUIREMENTS ============\e[0m'
RUN apt-get -y install wget vim curl
#####

#####
RUN echo '\e[36m\e[1m============ NGINX ============\e[0m'
RUN apt-get -y install nginx
#####

#####
RUN echo '\e[36m\e[1m============ PHP ============\e[0m'
RUN apt-get -y install php-fpm php-mysql
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
EXPOSE 80
#######

COPY srcs /
CMD bash start.sh
