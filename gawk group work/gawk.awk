#！ /usr/local/bin/gawk -f

#Find the Average Weight per japan Car

BEGIN {
    FS=";"
    total_weight=0;
    total_record=0;
}


{
    if ($NF ~ "Japan"){
        total_weight += $6
        total_record++
    }
}


End {
    print "total weight >" total_weight
    print "total record >" total_record
    print "The average Weight per japan car is >"(total_weight / total_record)
}