e_date="1640995200000"

enddate=$(echo "$e_date" | cut -c 1-10)

dt=$(date -d@$enddate +%Y-%m-%d)

#convert time back in epoch

date -d "$dt -1 day 0" +%s000

#to specific day and at specific hour

date -d "$dt +1 day 2"

date -d '1 month ago 0'

to get the last day of each month for the current year
date -d "2/1 + 1 month - 1 day" "+%b - %d days"
