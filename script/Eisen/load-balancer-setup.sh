#!/bin/bash

echo 'nameserver 192.168.122.1' > /etc/resolv.conf

apt-get update
apt-get install nginx apache2-utils -y

mkdir -p /etc/nginx/rahasisakita/

echo 'nameserver 10.57.1.2' > /etc/resolv.conf

echo '
upstream myweb {
        server 10.5.3.1;
        server 10.5.3.2;
        server 10.5.3.3;
}
server {
        listen 80;

        location / {
                proxy_pass http://myweb;
        }
}
' > /etc/nginx/sites-available/granz.channel.a12.com

ln -s /etc/nginx/sites-available/granz.channel.a12.com /etc/nginx/sites-enabled
rm -r /etc/nginx/sites-enabled/default
service nginx restart