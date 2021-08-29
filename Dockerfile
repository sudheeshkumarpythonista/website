FROM ubuntu
RUN apt-get update
RUN echo "tzdata tzdata/Areas select Europe" > /tmp/preseed.txt; \
    echo "tzdata tzdata/Zones/Europe select Berlin" >> /tmp/preseed.txt; \
    debconf-set-selections /tmp/preseed.txt && \
    apt-get update && \
    apt-get install -y tzdata
RUN apt-get  install apache2 -y
ADD . /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
ENV name Sudheesh
