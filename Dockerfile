FROM nginx:latest
LABEL maintainer="Groupe3"
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get install -y git
RUN rm -Rf /usr/share/nginx/html/*
RUN git clone https://github.com/StephaneInfo/ForkGR3.git /usr/share/nginx/html
RUN git clone https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation.git
COPY Projet_Fil_Rouge_IBFormation/nginx.conf /etc/nginx/conf.d/default.conf
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
