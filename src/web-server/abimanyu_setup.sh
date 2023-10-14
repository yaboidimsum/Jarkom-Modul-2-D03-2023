apt-get update
apt-get install nginx -y
apt-get install apache2 -y
apt-get install php php-fpm -y
apt-get install libapache2-mod-php7.0 -y
apt-get install unzip -y
apt-get install wget -y
apt-get install dnsutils -y

rm /etc/nginx/sites-enabled/*
rm /etc/nginx/sites-available/*
rm /etc/apache2/sites-enabled/*
rm /etc/apache2/sites-available/*


wget -O '/var/www/abimanyu.d03.com' 'https://     drive.usercontent.google.com/download?id=1a4V23hwK9S7hQEDEcv9FL14UkkrHc-Zc'
unzip -o /var/www/abimanyu.d03.com -d /var/www/
mv /var/www/abimanyu.yyy.com /var/www/abimanyu.d03
rm /var/www/abimanyu.d03.com
rm -rf /var/www/abimanyu.yyy.com

wget -O '/var/www/parikesit.abimanyu.d03.com' 'https://drive.usercontent.google.com/download?id=1LdbYntiYVF_NVNgJis1GLCLPEGyIOreS'
unzip -o /var/www/parikesit.abimanyu.d03.com -d /var/www/
mv /var/www/parikesit.abimanyu.yyy.com /var/www/parikesit.abimanyu.d03
rm /var/www/parikesit.abimanyu.d03.com
rm -rf /var/www/parikesit.abimanyu.yyy.com
mkdir /var/www/parikesit.abimanyu.d03/secret

wget -O '/var/www/rjp.baratayuda.abimanyu.d03.com' 'https://drive.usercontent.google.com/download?id=1pPSP7yIR05JhSFG67RVzgkb-VcW9vQO6'
unzip -o /var/www/rjp.baratayuda.abimanyu.d03.com -d /var/www/
mv /var/www/rjp.baratayuda.abimanyu.yyy.com /var/www/rjp.baratayuda.abimanyu.d03
rm /var/www/rjp.baratayuda.abimanyu.d03.com
rm -rf /var/www/rjp.baratayuda.abimanyu.yyy.com