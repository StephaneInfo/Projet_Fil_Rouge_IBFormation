FROM httpd:2.4
LABEL maintainer="Groupe3"
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get install -y git
RUN rm -Rf /usr/local/apache2/htdocs/*
RUN git clone https://github.com/StephaneInfo/ForkGR3.git /usr/local/apache2/htdocs/