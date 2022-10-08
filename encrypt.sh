#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
ISP=$(curl -s ip-api.com| grep -w  isp | cut -d ':' -f 2 | cut -d '"' -f2 )
COUNTRY=$(curl -s  ip-api.com| grep -w  country | cut -d ':' -f 2 | cut -d '"' -f2 )
MYIP=$(wget -qO- icanhazip.com);
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
IZIN=$(curl http://id1-vip.csrvpn.my.id:81/izin.json | grep "IP=" | grep $MYIP | sed 's/IP=//g')
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}This Script has Expired!${NC}";
echo "Please Contact Admin to Extend this Script "
echo "Telegram t.me/csrvpn"
echo "WhatsApp wa.me/6285336552251"
echo "Instagram instagram.com/csrvpn"
exit 0
fi
clear
echo "SHC Encryptor by csrvpn"
clear
read -p "Script : " Script
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
shc -f $Script -o $Script
echo -e ""
echo -e "================================="
echo -e "${green}Succesfully to encrypt our script${NC}"
echo -e "Input          : $Script "
echo -e "Output         : $Script "
echo -e "================================="
echo -e ""