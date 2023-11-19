echo 'nameserver 192.168.122.1' > /etc/resolv.conf

apt-get update
apt-get install ca-certificates unzip nginx php php-fpm -y


echo 'nameserver 10.5.1.2' > /etc/resolv.conf

mv modul-3 /var/www/granz.channel.a12.com

echo '
server {

listen 80;

root /var/www/granz.channel.a12.com;

index index.php index.html index.htm;
server_name _;

location / {
        try_files $uri $uri/ /index.php?$query_string;
}

# pass PHP scripts to FastCGI server
location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
}

location ~ /\.ht {
        deny all;
}

error_log /var/log/nginx/granz.channel.a12.com_error.log;
access_log /var/log/nginx/granz.channel.a12.com_access.log;
}
' > /etc/nginx/sites-available/granz.channel.a12.com

ln -s /etc/nginx/sites-available/granz.channel.a12.com /etc/nginx/sites-enabled
rm /etc/nginx/sites-enabled/default
service php7.3-fpm start
service nginx restart