#!/bin/bash

apt-get update
apt-get install bind9 -y

mkdir /etc/bind/jarkom

echo "
zone \"riegel.canyon.a12.com\" {
        type master;
        file \"/etc/bind/jarkom/riegel.canyon.a12.com\";
};

zone \"granz.channel.a12.com\" {
        type master;
        file \"/etc/bind/jarkom/granz.channel.a12.com\";
};
" > /etc/bind/named.conf.local

echo "
\$TTL 604800
@   IN  SOA     riegel.canyon.a12.com. root.riegel.canyon.a12.com. (
2023100901
604800
86400
2419200
604800
)
@   IN  NS      riegel.canyon.a12.com.
@   IN  A       10.5.4.1
www IN  CNAME   riegel.canyon.a12.com.
@   IN  AAAA    ::1
" > /etc/bind/jarkom/riegel.canyon.a12.com

echo "
\$TTL 604800
@   IN  SOA     granz.channel.a12.com. root.granz.channel.a12.com. (
2023100901
604800
86400
2419200
604800
)
@   IN  NS      granz.channel.a12.com.
@   IN  A       10.5.3.1
www IN  CNAME   granz.channel.a12.com.
@   IN  AAAA    ::1
" > /etc/bind/jarkom/granz.channel.a12.com

#Forwarder
# Forwarder
echo 'options {
        directory "/var/cache/bind";

        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0s placeholder.

         forwarders {
                192.168.122.1;
         };

        //========================================================================
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //========================================================================
        //dnssec-validation auto;
        allow-query{any;};
        listen-on-v6 { any; };
};
' > /etc/bind/named.conf.options


#restart Bind-9
service bind9 restart