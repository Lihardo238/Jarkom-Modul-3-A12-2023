echo 'upstream myweb {
        server 10.5.3.1;
        server 10.5.3.2;
}
server {
        listen 80;

        location / {
                proxy_pass http://myweb;
        }
}
' > /etc/nginx/sites-available/granz.channel.a12.com

service nginx restart
root@Eisen:~# ls
load-balancer-setup.sh        set-algorithm-leastconnection.sh
set-algorithm-generichash.sh  set-algorithm-roundrobin.sh
set-algorithm-iphash.sh       set-authentication.sh
root@Eisen:~# cat set-algorithm-roundrobin.sh
echo 'upstream myweb {
        server 10.5.3.1;
        server 10.5.3.2;
}
server {
        listen 80;

        location / {
                proxy_pass http://myweb;
        }
}
' > /etc/nginx/sites-available/granz.channel.a12.com