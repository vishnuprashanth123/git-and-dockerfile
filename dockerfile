FROM  ubuntu:latest
RUN apt-get update
ARG DEDIAN-FRONTEND=noninteractive
RUN apt-get install apache2 -y
COPY . /var/www/html
EXPOSE 80
CMD  ['apache2' ,'-d',' FOREGROUND']
