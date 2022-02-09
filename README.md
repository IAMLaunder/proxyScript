# proxyScript
This is just a small script made to run on a ubuntu server to create a proxy
not perfect and definently not secure as using port 80
to run
1. sudo -s
2. create a user: adduser squid
3. usermod -aG sudo squid
4. run script
5. systemctl restart squid 
get ip
username should be system user and password is what you added at end of script
