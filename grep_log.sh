#!/bin/bash

# grep 20:40 - 20:46
awk '
{
    if ($1 == "'"2023-03-04"'" && $2 >= "'"20:40:00,000"'" && $2 <= "'"20:46:59,999"'") {
        print $0
    }
}' app.log > app_2040-2046.log

# grep ERROR log
awk '
{
    if ($1 == "'"2023-03-04"'" && $5 == "'"[ERROR]:"'") {
        print $0
    }
}' app.log > app_err.log

# to csv
awk '
{
    c="";for(i=6;i<=NF;i++) c=c $i" "; 
    printf("\"%s %s\",\"%s\",\"%s\"\n",$1,$2,$5,c)
}' app.log > app_log.csv