FROM nginx:latest
LABEL maintainer="Groupe3"
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get install -y git
RUN rm -Rf /usr/share/nginx/html/*
RUN git clone https://github.com/StephaneInfo/ForkGR3.git /usr/share/nginx/html
CMD nginx -g 'daemon off;'
