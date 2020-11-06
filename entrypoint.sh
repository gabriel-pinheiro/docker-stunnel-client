cat <<EOT > /etc/stunnel/stunnel.conf
fips = no
setuid = nobody
setgid = nogroup
pid = /sck/stunnel.pid
debug = 7
delay = yes
output = /var/log/stunnel4/stunnel.log
[client]
  client = yes
EOT
echo "  accept = 127.0.0.1:${LOCAL_PORT}"  >> /etc/stunnel/stunnel.conf
echo "  connect = ${HOST}:${REMOTE_PORT}"  >> /etc/stunnel/stunnel.conf

mkdir -p /var/log/stunnel4
touch /var/log/stunnel4/stunnel.log
chown -R nobody:nogroup /var/log/stunnel4

mkdir /sck
chown -R nobody:nogroup /sck
/usr/bin/stunnel /etc/stunnel/stunnel.conf
tail -f /var/log/stunnel4/stunnel.log
