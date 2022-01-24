#! /bin/bash
ex=".ixc";
names=($(ls /var/www/bkp -ltr --time-style='+%s' |grep "$ex" |sed -r -e 's/.*\s[0-9]+\s[0-9]+\s(.*)/\1/'));
sizes=($(ls /var/www/bkp -ltr --time-style='+%s' |grep "$ex" |sed -r -e 's/.*\s([0-9]+)\s[0-9]+\s.*/\1/'));
dates=($(ls /var/www/bkp -ltr --time-style='+%s' |grep "$ex" |sed -r -e 's/.*\s[0-9]+\s([0-9]+)\s.*/\1/'));
ID=0;
timestamp=$(date '+%s');
echo "id|nome|size|uptime";
for i in "${names[@]}";
do
    uptime=$(( timestamp - ${dates[$ID]} ));
    echo "$ID|${names[$ID]}|${sizes[$ID]}|$uptime";
    let ID=ID+1;
done;
