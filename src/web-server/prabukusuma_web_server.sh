apt-get update
apt-get install nginx -y
apt-get install unzip -y
apt-get install php php-fpm -y
apt-get install dnsutils -y

rm /etc/nginx/sites-enabled/*
rm /etc/nginx/sites-available/*

service php7.2-fpm start

echo '
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>prabukusuma</title>
</head>
<body>
    Im prabukusuma
</body>
</html>
' > /var/www/html/index.html

echo '
server {
    listen 8001;
    root /var/www/html/;
    index index.html index.htm;
    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }

    error_log /var/log/nginx/prabukusuma_error.log;
    access_log /var/log/nginx/prabukusuma_access.log;
}
 ' > /etc/nginx/sites-available/prabukusuma.d03.com

 ln -s /etc/nginx/sites-available/prabukusuma.d03.com /etc/nginx/sites-enabled/

 service nginx restart