#!/bin/sh

#export KAVG
esxtop -b -a -c /scripts/disk_config -d 5 -n 1 > /scripts/esxtop-output.csv

# The CSV file
FILE="/scripts/esxtop-output.csv"
# The output file
OUTPUT="/scripts/output.txt"

# Use awk to find the values and write them to the output file
awk -v RS=',|\n' '{print NR, $0}' "$FILE" > "$OUTPUT"

# get string
cat /scripts/output.txt | grep "Physical Disk SCSI Device(.*)\\\\Average Kernel MilliSec/Command"
