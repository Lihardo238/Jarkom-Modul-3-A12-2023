echo '
upstream myweb {
        least_conn;
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

service nginx restart