# go to root
cd

# install stunnel
yum install stunnel
cat > /etc/stunnel/stunnel.conf <<-END
pid = /var/run/stunnel.pid
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1


[dropbear]
accept = 443
connect = 127.0.0.1:110

[openvpn]
client = no
accept = 444
connect = 127.0.0.1:1194
cert = /etc/stunnel/stunnel.pem

END
#pemisiom
mkdir /var/run/stunnel
chown nobody:nobody /var/run/stunnel

#membuat sertifikat
wget -O /etc/stunnel/stunnel.pem "https://raw.githubusercontent.com/ahsnet/aku/master/stunnel.pem"
chmod +x /etc/stunnel/stunnel.pem

#konfigurasi stunnel
wget -O /etc/rc.d/init.d/stunnel "https://raw.githubusercontent.com/95dewadew/ooo/master/st"

#pemision
chmod +x /etc/rc.d/init.d/stunnel
/sbin/chkconfig --add stunnel

#restart
service stunnel start
/etc/init.d/stunnel restart

#pesan
echo "SSL/TLS Berhasil di install dengan port 443"
echo ""
rm -f tls
