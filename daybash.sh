#!/bin/bash
read  -p "Please enter the date taking 2022-10-24    as example       " date
echo "${date}"
#now date
nowYear = "`date+%Y`"
startDate = str_replace("-","",${date})
endDate = "`date +%Y%m%d`"

#second
startDateTime=`date -d "$startDate" +%s`
endDateTime=`date -d "$endDate" +%s`
#
diff=$(($endDateTime - $startDateTime))
diffCount=$(($diff / 86400))

if [ $diffCount -lt 0 ] 
then
 echo ${date}" Late"
else
echo "days： "${diffCount}
fi