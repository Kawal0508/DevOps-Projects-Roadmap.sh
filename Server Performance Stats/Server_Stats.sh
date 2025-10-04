#!/bin/bash

BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
bold=$(tput bold)
normal=$(tput sgr0)

echo -e "\n${RED}====================================================${NC}"

echo -e "\n${RED}   ${bold}Start of Server Performance Statistics Script${normal}${NC}"

echo -e "\n${RED}====================================================${NC}"

echo -e "\n${GREEN}System Uptime Info :${NC}"
uptime

echo -e "\n${BLUE}========================================${NC}"

echo -e "\n${GREEN}Total CPU Usage :${NC}"
top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'

echo -e "\n${BLUE}========================================${NC}"

echo -e "\n${GREEN}Total Memory Usage :${NC}"
free | grep "Mem:" -w | awk '{printf "Total: %.1fGi\nUsed: %.1fGi (%.2f%%)\nFree: %.1fGi (%.2f%%)\n",$2/1024^2, $3/1024^2, $3/$2 * 100, $4/1024^2, $4/$2 * 100}'

echo -e "\n${BLUE}========================================${NC}"

echo -e "\n${GREEN}Total Disk Usage :${NC}"
df -h | grep "/" -w | awk '{printf "Total: %sG\nUsed: %s (%.2f%%)\nFree: %s (%.2f%%)\n",$3 + $4, $3, $3/($3+$4) * 100, $4, $4/($3+$4) * 100}'

echo -e "\n${BLUE}========================================${NC}"

echo -e "\n${GREEN}Top 5 Processes by Memory Usage :${NC}"
ps aux --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'

echo -e "\n${BLUE}========================================${NC}"

echo -e "\n${GREEN}Top 5 Processes by CPU Usage :${NC}"
ps aux --sort -%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $11}'

echo -e "\n${RED}========================================${NC}"

echo -e "\n${RED}   ${bold}Stretch goal : more stats to show ${normal}${NC}"

echo -e "\n${RED}========================================${NC}"

echo -e "\n${GREEN}Logged in User:${NC}"
whoami

echo -e "\n${BLUE}========================================${NC}"

echo -e "\n${GREEN}OS Version:${NC}"
hostnamectl | grep "Operating System"

echo -e "\n${BLUE}========================================${NC}"

echo -e "\n${GREEN}Failed Login Attempts:${NC}"
sudo lastb

echo -e "\n${RED}====================================================${NC}"

echo -e "\n${RED}    End of Server Performance Statistics Script${NC}"

echo -e "\n${RED}====================================================${NC}"