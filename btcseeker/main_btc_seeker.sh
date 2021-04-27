#!/bin/bash
while true; do
a=$( curl --silent "https://www.binance.com/api/v1/aggTrades?limit=1&symbol=BTCUSDT" | cut -d ":" -f 3| cut -d "," -f 1| tr '"' ' ')
b=$( printf "%.0f" $a )
if [ "$b" -le "6100" ]
then
 curl "https://api.telegram.org/bot[bot_api_token]/sendMessage?chat_id=@[channel_name]&text=$a"
 
 #bot_api_token get from botfather after created
 #add bot to the channel as admin
 #see channel infor url to get the /[channel_name]
 #A log channel should be created to monitor the failures
fi

sleep 5;
done
