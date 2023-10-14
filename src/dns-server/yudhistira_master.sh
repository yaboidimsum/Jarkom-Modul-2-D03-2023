apt-get update -y
apt-get install bind9 -y
apt-get install dnsutils -y

mkdir /etc/bind/main

echo 'zone "arjuna.d03.com" {
	type master;
    also-notify { 10.23.1.5; };
    allow-transfer { 10.23.1.5; };
	file "/etc/bind/main/arjuna.d03.com";
};

zone "abimanyu.d03.com" {
	type master;
    also-notify { 10.23.1.5; };
	file "/etc/bind/main/abimanyu.d03.com";
    allow-transfer { 10.23.1.5; };
};

zone "3.23.10.in-addr.arpa" {
	type master;
	file "/etc/bind/main/3.23.10.in-addr.arpa";
};
' > /etc/bind/named.conf.local

echo '
;
; BIND data file for local loopback interface
;
$TTL  604800
@   IN      SOA     abimanyu.d03.com.  root.abimanyu.d03.com. (
                    2023100902      ; Serial
                        604800      ; Refresh
                        86400       ; Retry 
                        2419200     ; Expire
                        604800  )   ; Negative Cache TTL
;
@               IN      NS      abimanyu.d03.com.
@               IN      A       10.23.3.3       ; IP Abimanyu
www             IN      CNAME   abimanyu.d03.com.
www.parikesit   IN      CNAME   parikesit.abimanyu.d03.com.
parikesit       IN      A       10.23.3.3      ; IP Abimanyu
ns1             IN      A       10.23.1.5      ; IP werkudara
baratayuda              NS      ns1
@               IN      AAAA    ::1
' > /etc/bind/main/abimanyu.d03.com

echo '
;
; BIND data file for local loopback interface
;
$TTL  604800
@   IN      SOA     arjuna.d03.com.  root.arjuna.d03.com. (
                    2023100902      ; Serial
                        604800      ; Refresh
                        86400       ; Retry 
                        2419200     ; Expire
                        604800  )   ; Negative Cache TTL
;
@   IN      NS      arjuna.d03.com.
@   IN      A       10.23.1.4       ; IP Yudhistira
www IN      CNAME   arjuna.d03.com.
@   IN      AAAA    ::1
' > /etc/bind/main/arjuna.d03.com

echo '
;
; BIND data file for local loopback interface
;
$TTL  604800
@   IN      SOA     abimanyu.d03.com.  root.abimanyu.d03.com. (
                    2023100902      ; Serial
                        604800      ; Refresh
                        86400       ; Retry 
                        2419200     ; Expire
                        604800  )   ; Negative Cache TTL
;
3.23.10.in-addr.arpa.    IN  NS     abimanyu.d03.com.
3                        IN  PTR    abimanyu.d03.com.
' > /etc/bind/main/3.23.10.in-addr.arpa

host -t PTR 10.23.3.3

echo 'options{
        directory "/var/cache/bind";
        
        // dnssec-validation auto;
        allow-query{ any; };
        auth-nxdomain no;
        listen-on-v6{ any; };
};' > /etc/bind/named.conf.options

service bind9 restart
service bind9 restart