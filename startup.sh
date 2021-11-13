#!/bin/sh
echo "What year messages do you want to Archive Example is 2020: "
read YEAR
echo "The script is running in Background now, you can trace the Logs in ./script.log"
echo "This is goind to spend a time, Have a Break.."
cd /opt/zimbra/store/0/
rm -f ./year
rm -f ./msg_"$YEAR".txt
echo "$YEAR" >> "./year"
sh script2.sh &