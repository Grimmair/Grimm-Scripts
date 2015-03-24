#!/bin/bash
source $HOME/rojekti/library.sh

i=1;
while [ $i -ne 0 ]
do
clear
echo "Welcome to Puppetmaster easy installation. "
echo "Please go in numerical order, unless you are IT professional "
echo "1. Set static IP"
echo "2. Set hosts "
echo "3. Install puppetmaster "
echo "4. Check installation "
echo "5. Install NTP"
echo "6. Backups"
echo "7. Configure ntp.conf"
echo "8. Configure puppetmaster.conf "
echo "9. Configure SSL-certificates"
echo "10 Exit "
echo ""
read -p "Choose what you want to do: " choice
case $choice in

1) fun05 ;;
2) fun01 ;;
3) fun02 ;;
4) fun03 ;;
5) fun07 ;;
6) fun04 ;;
7) fun08 ;;
8) fun06 ;;
9) fun09 ;;
11) fun10 ;;
10) exit ;;
*) echo "Something went horribly wrong"
esac

done
