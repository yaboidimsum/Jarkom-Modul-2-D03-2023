apt-get update -y
apt-get install bind9 -y

mkdir /etc/bind/baratayuda

echo 'zone "abimanyu.d03.com" {
    type slave;
    masters { 10.23.1.4; };
    file "/var/lib/bind/abimanyu.d03.com";
};

zone "arjuna.d03.com" {
    type slave;
    masters { 10.23.1.4; };
    file "/var/lib/bind/arjuna.d03.com";
};

zone "baratayuda.abimanyu.d03.com"{
    type master;
    file "/etc/bind/baratayuda/baratayuda.abimanyu.d03.com";
};
' > /etc/bind/named.conf.local

echo 'options{
        directory "/var/cache/bind";
        
        // dnssec-validation auto;
        allow-query{any;};
        auth-nxdomain no;
        listen-on-v6{ any; };
};' > /etc/bind/named.conf.options

echo '
;
; BIND data file for local loopback interface
;
$TTL  604800
@   IN      SOA     baratayuda.abimanyu.d03.com.  root.baratayuda.abimanyu.d03.com. (
                    2023100601      ; Serial
                        604800      ; Refresh
                        86400       ; Retry
                        2419200     ; Expire
                        604800  )   ; Negative Cache TTL
;
@   IN      NS      baratayuda.abimanyu.d03.com.
@   IN      A       10.23.3.3       ;
www IN      CNAME   baratayuda.abimanyu.d03.com.
rjp IN      A       10.23.3.3       ;
www.rjp     IN      CNAME   rjp.baratayuda.abimanyu.d03.com.
' > /etc/bind/baratayuda/baratayuda.abimanyu.d03.com


service bind9 restart
service bind9 restart