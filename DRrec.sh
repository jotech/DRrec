#!/usr/local/bin/bash

url="$1"
echo "got link:" $url

# set stream according to url patter
if [[ "$url" == *"radiokultur"* ]]
then
    echo "streaming dkultur"
    stream="http://dradio_mp3_dkultur_m.akacast.akamaistream.net/7/530/142684/v1/gnl.akacast.akamaistream.net/dradio_mp3_dkultur_m"
else
    echo "streaming dlf"
    stream="http://dradio_mp3_dlf_m.akacast.akamaistream.net/7/249/142684/v1/gnl.akacast.akamaistream.net/dradio_mp3_dlf_m"
fi


# split array
array=(${url//%7C/ })

# get information
program=${array[1]}
start=${array[3]}
end=${array[4]}

# calculate recording time
rectime=$(( $(date -jf "%Y%m%d%H%M%S" "$end" +%s) - $(date -jf "%Y%m%d%H%M%S" "$start" +%s) ))

echo -e "\nWill record" $program "for" $rectime "seconds starting at" $(date -jf "%Y%m%d%H%M%S" "$start") 

streamripper="/usr/local/bin/streamripper"
start_month=$(date -jf "%Y%m%d%H%M%S" $start +%m)
start_day=$(date -jf "%Y%m%d%H%M%S" $start +%d)
start_hour=$(date -jf "%Y%m%d%H%M%S" $start +%H)
start_min=$(date -jf "%Y%m%d%H%M%S" $start +%M)

# adding cron job (min hour day month weekday)
{ 
    crontab -l | { cat; echo "$start_min $start_hour $start_day $start_month * $streamripper $stream -l $rectime -d `pwd` -D \%D-\%S_-_\%T -t -k 0"; } | crontab -
} &> /dev/null
echo "cron job added"
