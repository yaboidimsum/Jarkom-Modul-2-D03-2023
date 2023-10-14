apt-get update -y
apt-get install nginx -y


rm /etc/nginx/sites-enabled/*
rm /etc/nginx/sites-available/*

echo '
upstream worker {
        server 10.23.3.2:8003;
        server 10.23.3.3:8002;
        server 10.23.3.4:8001;
}

server {
    listen 80;

    server_name arjuna.d03.com www.arjuna.d03.com;

    location / {
        proxy_pass http://worker;
    }
}' > /etc/nginx/sites-available/arjuna.d03.com

ln -s /etc/nginx/sites-available/arjuna.d03.com /etc/nginx/sites-enabled

service nginx restart