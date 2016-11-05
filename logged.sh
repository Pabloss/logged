#!/bin/bash

month=`last | head -1 | awk '{print $5}'`
day=`last | head -1 | awk '{print $6}'`
time=`last | head -1 | awk '{print $7}'`
still=`last | head -1 | awk '{print $8}'`

if [ "$still" = 'still' ]
then
    logged=`last | head -1 | awk '{print $9}'`
    if [ "$logged" = 'logged' ]
    then
        in_word=`last | head -1 | awk '{print $10}'`
        if [ "$in_word" = 'in' ]
        then 
            last_logged_time=`date --date="$month $day $time" +%s`
#            echo `date --date="$month $day $time" +%s`
        fi
    fi
fi

now_time=`date +%s`

#echo "You are being logged till now for: $(( (now_time - last_logged_time) / 60 )) minutes"

logged_minutes=$((  (now_time - last_logged_time) / 60 ))
logged_hours=$((logged_minutes / 60 ))

rest_of_minutes=$(( logged_minutes % 60 ))


#echo "You are being logged till now for $(( logged_hours )) h and $(( rest_of_minutes  )) m"
echo "$(( logged_hours ))h $(( rest_of_minutes  ))m"
