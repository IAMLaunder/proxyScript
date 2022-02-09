#! /bin/sh

echo "Script Starting"

echo "start updates"
apt-get update && apt-get -y upgrade
apt-get install squid
apt install rpl
echo "adjusting config file"

sed -i 's/http_access deny all/https_access allow authenticated/' /etc/squid/squid.conf
sed -i 's/http_port 3128/http_port 80/' /etc/squid/squid.conf
#line 587 needs 3 enters then change line 587 588 589
sed -i '445s/.*/\n/' /etc/squid/squid.conf
sed -i '445s/.*/\n/' /etc/squid/squid.conf
sed -i '445s/.*/\n/' /etc/squid/squid.conf
sed -i '445s/.*/thisiswhatwillgetreplaced/' /etc/squid/squid.conf
rpl "thisiswhatwillgetreplaced" "auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd/" /etc/squid/squid.conf
sed -i '446s/.*/auth_param basic realm proxy/' /etc/squid/squid.conf
sed -i '447s/.*/acl authenticated proxy_auth REQUIRED/' /etc/squid/squid.conf
echo "finished config"

echo "creating password for proxy"
touch /etc/squid/passwd
apt install apache2-utils
htpasswd -c /etc/squid/passwd squid
