service php7.2-fpm start

a2enmod rewrite
echo '
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>abimanyu</title>
</head>
<body>
    Im abimanyu
</body>
</html>
' > /var/www/html/index.html

echo '
server {
    listen 8002;
    root /var/www/html/;
    index index.html index.htm;
    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }

    error_log /var/log/nginx/abimanyu_error.log;
    access_log /var/log/nginx/abimanyu_access.log;
}
 ' > /etc/nginx/sites-available/abimanyu.d03.com

ln -s /etc/nginx/sites-available/abimanyu.d03.com /etc/nginx/sites-enabled

service nginx restart

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/abimanyu.d03
  ServerName abimanyu.d03.com
  ServerAlias www.abimanyu.d03.com

  <Directory /var/www/abimanyu.d03/index.php/home>
          Options +Indexes
  </Directory>

  Alias "/home" "/var/www/abimanyu.d03/index.php/home"

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/abimanyu.d03.com.conf

echo 'RewriteEngine On
RewriteCond %{REQUEST_URI} ^/public/images/(.*)(abimanyu)(.*\.(png|jpg))
RewriteCond %{REQUEST_URI} !/public/images/abimanyu.png
RewriteRule abimanyu http://parikesit.abimanyu.d03.com/public/images/abimanyu.png$1 [L,R=301]' > /var/www/parikesit.abimanyu.d03/.htaccess

echo -e '<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/parikesit.abimanyu.d03

  ServerName parikesit.abimanyu.d03.com
  ServerAlias www.parikesit.abimanyu.d03.com

  <Directory /var/www/parikesit.abimanyu.d03/public>
          Options +Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.d03/secret>
          Options -Indexes
  </Directory>

  <Directory /var/www/parikesit.abimanyu.d03>
          Options +FollowSymLinks -Multiviews
          AllowOverride All
  </Directory>

  Alias "/public" "/var/www/parikesit.abimanyu.d03/public"
  Alias "/secret" "/var/www/parikesit.abimanyu.d03/secret"
  Alias "/js" "/var/www/parikesit.abimanyu.d03/public/js"

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.d03.com.conf

a2ensite parikesit.abimanyu.d03.com.conf

echo -e '<VirtualHost *:14000 *:14400>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/rjp.baratayuda.abimanyu.d03
  ServerName rjp.baratayuda.abimanyu.d03.com
  ServerAlias www.rjp.baratayuda.abimanyu.d03.com

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/rjp.baratayuda.abimanyu.d03.com.conf

echo -e '# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 14000
Listen 14400


<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet' > /etc/apache2/ports.conf

a2ensite rjp.baratayuda.abimanyu.d03.com.conf

echo -e '<VirtualHost *:14000 *:14400>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/rjp.baratayuda.abimanyu.d03
  ServerName rjp.baratayuda.abimanyu.d03.com
  ServerAlias www.rjp.baratayuda.abimanyu.d03.com
  ServerAlias 10.23.3.3

  <Directory /var/www/rjp.baratayuda.abimanyu.d03>
          AuthType Basic
          AuthName "Restricted Content"
          AuthUserFile /etc/apache2/.htpasswd
          Require valid-user
  </Directory>

  ErrorDocument 404 /error/404.html
  ErrorDocument 403 /error/403.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/rjp.baratayuda.abimanyu.d03.com.conf

a2ensite rjp.baratayuda.abimanyu.d03.com.conf


service apache2 restart