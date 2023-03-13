#!/bin/bash
# monitoring script
# ovidiu asiminei
## ###################

echo "MONITORING server"

echo "Date"
echo "-----------------------------------"
date
echo "-----------------------------------"

# Define Variable tecreset
tecreset=$(tput sgr0)

# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo -e '\E[32m'"Internet: $tecreset Connected" || echo -e '\E[32m'"Internet: $tecreset Disconnected"



# Check Architecture
architecture=$(uname -m)
echo -e '\E[32m'"Architecture :" $tecreset $architecture

# Check Kernel Release
kernelrelease=$(uname -r)
echo -e '\E[32m'"Kernel Release :" $tecreset $kernelrelease

# Check hostname
echo -e '\E[32m'"Hostname :" $tecreset $HOSTNAME
echo "-----------------------------------------"

#echo "monitoring server"

echo "Server uptime"
echo "---------------"
uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e '\E[32m'"System Uptime Days/(HH:MM) :" $tecreset $tecuptime

# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e '\E[32m'"Load Average :" $tecreset $loadaverage

# Check Logged In Users
echo "--------------------------------------------------------"
who>/tmp/who
echo -e '\E[32m'"Logged In users :" $tecreset && cat /tmp/who

# Check DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e '\E[32m'"Name Servers :" $tecreset $nameservers


# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e '\E[32m'"Load Average :" $tecreset $loadaverage



echo "----------------------"
echo "free memory"
echo "----------------------"
free -m
echo "----------------------"

echo "----------------------"
echo " free space"
echo "----------------------"

df -h

# Check services for UBB : MySql and Apache

echo "-----------------------------------"
echo " check ig mysql is running "
echo "-----------------------------------"
ps -ef | grep mysql

echo "----------------------------------"
echo " check if apache is running "
echo "----------------------------------"
ps -ef | grep httpd
