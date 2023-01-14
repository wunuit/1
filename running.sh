#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : Adit Ardiansyah
# (C) Copyright 2022
# =========================================
clear
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

# // Clear
clear
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
yellow='\033[0;33m'
domain=$(cat /etc/xray/domain)
WKT=$(curl -s ipinfo.io/timezone)
IPVPS=$(curl -s ipv4.icanhazip.com)
ISPVPS=$( curl -s ipinfo.io/org )
tram=$(free -m | awk 'NR==2 {print $2}')
swap=$(free -m | awk 'NR==4 {print $2}')
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
Open_SSH=$(systemctl status ssh | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Dropbear=$(systemctl status dropbear | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
SSH_Websocket=$(systemctl status ws-stunnel | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
#OpenVPN=$(systemctl status openvpn | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Nginx_Webserver=$(systemctl status nginx | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
#Haproxy=$(systemctl status haproxy | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
#DNS_Server=$(systemctl status server | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
#DNS_Client=$(systemctl status client | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
#OpenVPN_Websocket=$(systemctl status ws | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
XRAY_Vmess_TLS=$(systemctl status xray | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
XRAY_Vmess_gRPC=$(systemctl status xray | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
XRAY_Vmess_None_TLS=$(systemctl status xray | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
XRAY_Vless_TLS=$(systemctl status xray | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
XRAY_Vless_gRPC=$(systemctl status xray | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
XRAY_Vless_None_TLS=$(systemctl status xray | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Trojan_gRPC=$(systemctl status xray | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Trojan_WS=$(systemctl status xray | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Shadowsocks_WS=$(systemctl status xray | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Shadowsocks_gRPC=$(systemctl status xray | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Iptables=$(systemctl status netfilter-persistent | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
#Squid=$(systemctl status squid | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
#BadVPN=$(systemctl status badvpn3 | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
RClocal=$(systemctl status rc-local | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Autorebot=$(systemctl status rc-local | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
if [[ $Open_SSH == "running" ]]; then
    status_1="${grenbo}Online${NC}"
else
    status_1="${RED}Offline${NC}"
fi

if [[ $Dropbear == "running" ]]; then
    status_2="${grenbo}Online${NC}"
else
    status_2="${RED}Offline${NC}"
fi

#if [[ $Dropbear_Websocket == "running" ]]; then
    status_3="${grenbo}Online${NC}"
#else
  #  status_3="${RED}Offline${NC}"
#fi

if [[ $SSH_Websocket == "running" ]]; then
    status_4="${grenbo}Online${NC}"
else
    status_4="${RED}Offline${NC}"
fi

#if [[ $OpenVPN == "exited" ]]; then
 #   status_5="${grenbo}Online${NC}"
#else
    status_5="${RED}Offline${NC}"
#fi

if [[ $Nginx_Webserver == "running" ]]; then
    status_6="${grenbo}Online${NC}"
else
    status_6="${RED}Offline${NC}"
fi

#if [[ $Haproxy == "running" ]]; then
  #  status_7="${grenbo}Online${NC}"
#else
  #  status_7="${RED}Offline${NC}"
#fi

#if [[ $DNS_Server == "running" ]]; then
   # status_8="${grenbo}Online${NC}"
#else
  #  status_8="${RED}Offline${NC}"
#fi

#if [[ $DNS_Client == "running" ]]; then
  #  status_9="${grenbo}Online${NC}"
#else
  #  status_9="${RED}Offline${NC}"
#fi

#if [[ $OpenVPN_Websocket == "running" ]]; then
   # status_10="${grenbo}Online${NC}"
#else
  #  status_10="${RED}Offline${NC}"
#fi

if [[ $XRAY_Vmess_TLS == "running" ]]; then
    status_11="${grenbo}Online${NC}"
else
    status_11="${RED}Offline${NC}"
fi

if [[ $XRAY_Vmess_gRPC == "running" ]]; then
    status_12="${grenbo}Online${NC}"
else
    status_12="${RED}Offline${NC}"
fi

if [[ $XRAY_Vmess_None_TLS == "running" ]]; then
    status_13="${grenbo}Online${NC}"
else
    status_13="${RED}Offline${NC}"
fi

if [[ $XRAY_Vless_TLS == "running" ]]; then
    status_14="${grenbo}Online${NC}"
else
    status_14="${RED}Offline${NC}"
fi

if [[ $XRAY_Vless_gRPC == "running" ]]; then
    status_15="${grenbo}Online${NC}"
else
    status_15="${RED}Offline${NC}"
fi

if [[ $XRAY_Vless_None_TLS == "running" ]]; then
    status_16="${grenbo}Online${NC}"
else
    status_16="${RED}Offline${NC}"
fi

if [[ $Trojan_gRPC == "running" ]]; then
    status_17="${grenbo}Online${NC}"
else
    status_17="${RED}Offline${NC}"
fi

if [[ $Trojan_WS == "running" ]]; then
    status_18="${grenbo}Online${NC}"
else
    status_18="${RED}Offline${NC}"
fi

if [[ $Shadowsocks_WS == "running" ]]; then
    status_19="${grenbo}Online${NC}"
else
    status_19="${RED}Offline${NC}"
fi

if [[ $Shadowsocks_gRPC == "running" ]]; then
    status_20="${grenbo}Online${NC}"
else
    status_20="${RED}Offline${NC}"
fi

if [[ $Iptables == "exited" ]]; then
    status_21="${grenbo}Online${NC}"
else
    status_21="${RED}Offline${NC}"
fi

if [[ $Squid == "running" ]]; then
    status_22="${grenbo}Online${NC}"
else
    status_22="${RED}Offline${NC}"
fi

if [[ $BadVPN == "running" ]]; then
    status_23="${grenbo}Online${NC}"
else
    status_23="${RED}Offline${NC}"
fi

if [[ $RClocal == "exited" ]]; then
    status_24="${grenbo}Online${NC}"
else
    status_24="${RED}Offline${NC}"
fi

if [[ $Autorebot == "exited" ]]; then
    status_25="${grenbo}Online${NC}"
else
    status_25="${RED}Offline${NC}"
fi
#IZIN
export Server_URL="raw.githubusercontent.com/wunuit/test/main"
License_Key=$(cat /etc/${Auther}/license.key)
export Nama_Issued_License=$( curl -s https://${Server_URL}/validated-registered-license-key.txt | grep -w $License_Key | cut -d ' ' -f 7-100 | tr -d '\r' | tr -d '\r\n')
clear
echo ""
echo -e "\033[1;93m─────────────────────────────────────\033[0m"
echo -e "\\e[42m      ⇲ Subscription Information ⇲   \E[0m"
echo -e "\033[1;93m─────────────────────────────────────\033[0m"
echo -e "\033[93mOperating System$NC    $grenbo:$NC$yellow $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')$NC"
echo -e "\033[93mClient Name$NC         $grenbo:$NC$yellow $Nama_Issued_License$NC"
echo -e "\033[93mTotal Amount Of RAM$NC $grenbo:$NC$yellow $tram MB$NC"
echo -e "\033[93mIp Server$NC           $grenbo:$NC$yellow $IPVPS$NC"
echo -e "\033[93mIsp Server$NC          $grenbo:$NC$yellow $ISPVPS$NC"
echo -e "\033[93mDomain$NC              $grenbo:$NC$yellow $(cat /etc/xray/domain)$NC"
echo -e "\033[93mServer Uptime$NC       $grenbo:$NC$yellow $(uptime -p | cut -d " " -f 2-10000)$NC"
echo -e "\033[93mExp Script$NC          $grenbo:$NC$yellow $(cat /etc/${Auther}/license-remaining-active-days.db)${NC} Days"
echo -e "\033[93mVersion$NC             $grenbo:$NC$yellow Version 3.0$NC"
echo -e "\033[1;93m─────────────────────────────────────\033[0m"
echo -e "\\e[42m      ⇲ Service Information ⇲        \E[0m"
echo -e "\033[1;93m─────────────────────────────────────\033[0m"
echo -e "${Blue}Service Open_SSH$NC            $grenbo:$NC $status_1"
echo -e "${Blue}Service Dropbear$NC            $grenbo:$NC $status_2"
echo -e "${Blue}Service Dropbear_Websocket$NC  $grenbo:$NC $status_3"
echo -e "${Blue}Service SSH_Websocket$NC       $grenbo:$NC $status_4"
echo -e "${Blue}Service Nginx_Webserver$NC     $grenbo:$NC $status_6"
echo -e "${Blue}Service Xray_Vmess_TLS$NC      $grenbo:$NC $status_11"
echo -e "${Blue}Service Xray_Vmess_gRPC$NC     $grenbo:$NC $status_12"
echo -e "${Blue}Service Xray_Vmess_None_TLS$NC $grenbo:$NC $status_13"
echo -e "${Blue}Service Xray_Vless_TLS$NC      $grenbo:$NC $status_14"
echo -e "${Blue}Service Xray_Vless_gRPC$NC     $grenbo:$NC $status_15"
echo -e "${Blue}Service Xray_Vless_None_TLS$NC $grenbo:$NC $status_16"
echo -e "${Blue}Service Trojan_gRPC$NC         $grenbo:$NC $status_17"
echo -e "${Blue}Service Trojan_WS$NC           $grenbo:$NC $status_18"
echo -e "${Blue}Service Shadowsocks_WS$NC      $grenbo:$NC $status_19"
echo -e "${Blue}Service Shadowsocks_gRPC$NC    $grenbo:$NC $status_20"
echo -e "${Blue}Service Iptables$NC            $grenbo:$NC $status_21"
#echo -e "${Blue}Service Squid$NC               $grenbo:$NC $status_22"
#echo -e "${Blue}Service BadVPN$NC              $grenbo:$NC $status_23"
echo -e "${Blue}Service RClocal$NC             $grenbo:$NC $status_24"
echo -e "${Blue}Service Autoreboot$NC          $grenbo:$NC $status_25"
echo -e "\033[1;93m─────────────────────────────────────\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
