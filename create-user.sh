#!/bin/bash
#
clear
echo ""
echo "-----------------MEMBUAT AKUN BY AHSNET------------------"
echo ""
read -p "Username : " kerdunet
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`curl icanhazip.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $ahsnet
exp="$(chage -l $ahsnet | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $kerdunet &> /dev/null
echo -e ""
echo -e "----------------------------"
echo -e "Data Login:"
echo -e "----------------------------"
echo -e "Host: $IP"
echo -e "PortSSH: 22, 143"
echo -e "Dropbear: 109, 110"
echo -e "Squid: 80,8080,3128"
echo -e "Username: $ahsnet "
echo -e "Password: $Pass"
echo -e "Config OpenVPN: $IP:81/1194-client.ovpn"
echo -e "Aktif Sampai: $exp"
echo -e "----------------------------"
