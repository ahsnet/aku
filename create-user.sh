#!/bin/bash


MYIP=$(wget -qO- ipv4.icanhazip.com)
echo "--------- MEMBUAT AKUN ------------"

if [[ $vps = "soned" ]]; then
	echo "                                                "
	echo "                           "
else
	echo "                                                 "
	echo "                "
fi

	echo "                   "
echo ""

read -p "Username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo "Username [$username] sudah ada!"
	exit 1
else
	read -p "Pasword: " password
	read -p "Berapa hari akun [$username] aktif: " AKTIF

	today="$(date +"%Y-%m-%d")"
	expire=$(date -d "$AKTIF days" +"%Y-%m-%d")
	useradd -M -N -s /bin/false -e $expire $username
	echo $username:$password | chpasswd

	echo ""
	echo "-----------------------------------"
	echo "Informasi Akun"
	echo "-----------------------------------"
	echo "Host/IP : $MYIP"
	echo "Username: $username"
	echo "Password: $password"
	echo "SSL/TLS : 443"
	echo "Dropbear: 109, 110"
	echo "Openssh : 22, 143"
	echo "Squid   : 80, 8080, 3128"
	echo "UdpGw   : 7000-7900"
	echo "Aktif   : $(date -d "$AKTIF days" +"%d-%m-%Y")"
	echo "-----------------------------------"
	echo "Open VPN: http://$MYIP:81/1194-client.ovpn"
	echo "Script BY:AHSNET "
	echo "-----------------------------------"
fi

cd ~/
rm -f /root/IP
