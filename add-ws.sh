#!/bin/bash
# Menu For Script
# Edition : Stable Edition V1.0
# Auther  : 
# (C) Copyright 2021-2022
# =========================================
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="raw.githubusercontent.com/wunuit/test/main"
export Server1_URL="raw.githubusercontent.com/wunuit/limit/main"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther=".geovpn"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
export CHATID="5491480146"
export KEY="5893916269:AAFoRG0z9y0Rewi6K3bF6_momM9Wyom6BGE"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

# // Exporting Network Interface
export NETWORK_IFACE="$(ip route show to default | awk '{print $5}')"

# // Validate Result ( 1 )
touch /etc/${Auther}/license.key
export Your_License_Key="$( cat /etc/${Auther}/license.key | awk '{print $1}' )"
export Validated_Your_License_Key_With_Server="$( curl -s https://${Server_URL}/validated-registered-license-key.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 1 )"
if [[ "$Validated_Your_License_Key_With_Server" == "$Your_License_Key" ]]; then
    validated='true'
else
    echo -e "${EROR} License Key Not Valid"
    exit 1
fi

# // Checking VPS Status > Got Banned / No
if [[ $IP == "$( curl -s https://${Server_URL}/blacklist.txt | cut -d ' ' -f 1 | grep -w $IP | head -n1 )" ]]; then
    echo -e "${EROR} 403 Forbidden ( Your VPS Has Been Banned )"
    exit  1
fi

# // Checking VPS Status > Got Banned / No
if [[ $Your_License_Key == "$( curl -s https://${Server_URL} | cut -d ' ' -f 1 | grep -w $Your_License_Key | head -n1)" ]]; then
    echo -e "${EROR} 403 Forbidden ( Your License Has Been Limited )"
    exit  1
fi

# // Checking VPS Status > Got Banned / No
if [[ 'Standart' == "$( curl -s https://${Server_URL}/validated-registered-license-key.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 6 )" ]]; then 
    License_Mode='Standart'
elif [[ Pro == "$( curl -s https://${Server_URL}/validated-registered-license-key.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 6 )" ]]; then 
    License_Mode='Pro'
else
    echo -e "${EROR} Please Using Genuine License !"
    exit 1
fi

# // Checking Script Expired
exp=$( curl -s https://${Server1_URL}/limit.txt | grep -w $IP | cut -d ' ' -f 3 )
now=`date -d "0 days" +"%Y-%m-%d"`
expired_date=$(date -d "$exp" +%s)
now_date=$(date -d "$now" +%s)
sisa_hari=$(( ($expired_date - $now_date) / 86400 ))
if [[ $sisa_hari -lt 0 ]]; then
    echo $sisa_hari > /etc/${Auther}/license-remaining-active-days.db
    echo -e "${EROR} Your License Key Expired ( $sisa_hari Days )"
    exit 1
else
    echo $sisa_hari > /etc/${Auther}/license-remaining-active-days.db
fi
clear
source /var/lib/scrz-prem/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo "-----------------------------------------";
echo "---------=[ Add Vmess Account ]=---------";
echo "-----------------------------------------";

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo "-----------------------------------------";
echo "---------=[ Add Vmess Account ]=---------";
echo "-----------------------------------------";
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			read -n 1 -s -r -p "Press any key to back on menu"
menu
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vmessworry$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vmesskuota$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "bug.com",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "bug.com",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
asi=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/worryfree",
      "type": "none",
      "host": "tsel.me",
      "tls": "none"
}
EOF`
aso=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/chat",
      "type": "none",
      "host": "c.whatsapp.net",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "bug.com",
      "tls": "tls"
}
EOF`
ama=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/worryfree",
      "type": "none",
      "host": "bug.com",
      "tls": "tls"
}
EOF`
ami=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/kuota-habis",
      "type": "none",
      "host": "bug.com",
      "tls": "tls"
}
EOF`
cat > /etc/geovpn/webserver/vmess-$user.txt <<-END
_______________________________
Thank You For Using Our Services
 Xray/Vmess Account
System Support:Debian 10 / Ubuntu 18.04/20.04
telegram: https://t.me/tau_samawa
_______________________________
      Format Vmess WS (CDN)
_______________________________

- name: Vmess-$user-WS (CDN)
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
_______________________________
Format Vmess WS (CDN) Non TLS
_______________________________

- name: Vmess-$user-WS (CDN) Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
_______________________________
     Format Vmess gRPC (SNI)
_______________________________

- name: Vmess-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
    grpc-service-name: vmess-grpc

_______________________________
    Link Vmess Account
_______________________________
VMESS WS TLS : vmess://$(echo $asu | base64 -w 0)
_______________________________
VMESS WS NO TLS : vmess://$(echo $ask | base64 -w 0)
_______________________________
VMESS WORRYFREE : vmess://$(echo $asi | base64 -w 0)
_______________________________
VMESS FLEX : vmess://$(echo $aso | base64 -w 0)
_______________________________
VMESS gRPC : vmess://$(echo $grpc | base64 -w 0)
_______________________________

END
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmess_base644=$( base64 -w 0 <<< $vmess_json4)
vmess_base645=$( base64 -w 0 <<< $vmess_json5)
vmess_base646=$( base64 -w 0 <<< $vmess_json6)
vmess_base647=$( base64 -w 0 <<< $vmess_json7)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $asi | base64 -w 0)"
vmesslink4="vmess://$(echo $aso | base64 -w 0)"
vmesslink5="vmess://$(echo $grpc | base64 -w 0)"
vmesslink6="vmess://$(echo $ama | base64 -w 0)"
vmesslink7="vmess://$(echo $ami | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="<code>-----------------------</code>
<code>      XRAY/VMESS</code>
<code>-----------------------</code>
<code>Remarks   : ${user}
CITY      : $CITY
ISP       : $ISP
Domain    : ${domain}
Port TLS  : 443
Port NTLS : 80
Port GRPC : 443
id        : ${uuid}
alterId   : 0
Security  : auto
network   : ws or grpc
path      : /vmess
path      : /worryfree
path      : /chat
Name      : vmess-grpc</code>
<code>-----------------------</code>
<code>     VMESS WS TLS</code>
<code>-----------------------</code>
<code>${vmesslink1}</code>
<code>-----------------------</code>
<code>   VMESS WS NO TLS</code>
<code>-----------------------</code>
<code>${vmesslink2}</code>
<code>-----------------------</code>
<code>  VMESS WORRYFREE</code>
<code>-----------------------</code>
<code>${vmesslink3}</code>
<code>-----------------------</code>
<code>     VMESS FLEX</code>
<code>-----------------------</code>
<code>${vmesslink4}</code>
<code>-----------------------</code>
<code>    VMESS gRPC</code>
<code>-----------------------</code>
<code>${vmesslink5}</code>
<code>-----------------------</code>
OpenClash : http://${domain}:81/vmess-$user.txt
<code>-----------------------</code>
Aktif Selama   : $masaaktif Hari
Dibuat Pada    : $tnggl
Berakhir Pada  : $expe
<code>-----------------------</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
clear
echo -e "" | tee -a /etc/log-create-user.log
echo -e "" | tee -a /etc/log-create-user.log
echo -e "------XRAY/VMESS-------" | tee -a /etc/log-create-user.log
echo -e "Domain    : ${domain}" | tee -a /etc/log-create-user.log
echo -e "Port TLS  : ${tls}" | tee -a /etc/log-create-user.log
echo -e "Port NTLS : ${none}" | tee -a /etc/log-create-user.log
echo -e "Port GRPC : ${tls}" | tee -a /etc/log-create-user.log
echo -e "ID        : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "alterId   : 0" | tee -a /etc/log-create-user.log
echo -e "Security  : auto" | tee -a /etc/log-create-user.log
echo -e "Network   : ws/grpc" | tee -a /etc/log-create-user.log
echo -e "Path      : /vmess" | tee -a /etc/log-create-user.log
echo -e "Path      : /worryfree" | tee -a /etc/log-create-user.log
echo -e "Path      : /chat" | tee -a /etc/log-create-user.log
echo -e "SerName   : vmess-grpc" | tee -a /etc/log-create-user.log
echo -e "-----------------------" | tee -a /etc/log-create-user.log
echo -e "Link TLS : ${vmesslink1}" | tee -a /etc/log-create-user.log
echo -e "-----------------------" | tee -a /etc/log-create-user.log
echo -e "Link none TLS : ${vmesslink2}" | tee -a /etc/log-create-user.log
echo -e "-----------------------" | tee -a /etc/log-create-user.log
#echo -e "Link TLS (WorryFree) : ${vmesslink6}" | tee -a /etc/log-create-user.log
#echo -e "-----------------------" | tee -a /etc/log-create-user.log
echo -e "Link (WorryFree) : ${vmesslink3}" | tee -a /etc/log-create-user.log
echo -e "-----------------------" | tee -a /etc/log-create-user.log
#echo -e "Link TLS (Kouta-habis) : ${vmesslink7}" | tee -a /etc/log-create-user.log
#echo -e "-----------------------" | tee -a /etc/log-create-user.log
echo -e "Link (Vmess Flex) : ${vmesslink4}" | tee -a /etc/log-create-user.log
echo -e "-----------------------" | tee -a /etc/log-create-user.log
echo -e "Link GRPC : ${vmesslink5}" | tee -a /etc/log-create-user.log
echo -e "-----------------------" | tee -a /etc/log-create-user.log
#echo -e "OpenClash : http://${domain}:81/vmess-$user.txt" | tee -a /etc/log-create-user.log
#echo -e "-----------------------" | tee -a /etc/log-create-user.log
echo -e "Aktif Selama   : $masaaktif Hari" | tee -a /etc/log-create-user.log
echo -e "Dibuat Pada    : $tnggl" | tee -a /etc/log-create-user.log
echo -e "Berakhir Pada  : $expe" | tee -a /etc/log-create-user.log
echo -e "-----------------------" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
rm /etc/xray/$user-tls.json > /dev/null 2>&1
rm /etc/xray/$user-none.json > /dev/null 2>&1
read -n 1 -s -r -p "Press any key to back on menu"
menu-vmess
