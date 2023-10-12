#!/bin/sh

#Export KAVG
esxtop -b -a -c /scripts/disk_config -d 5 -n 1 > /scripts/esxtop-output.csv

# The CSV file
FILE="/scripts/esxtop-output.csv"

# The output file
OUTPUT="/scripts/output.txt"

# Get env params
ESXI_NAME=$(awk -F '=' 'function t(s){gsub(/[[:space:]]/,"",s);return s};/^ESXI_NAME/{v=t($2)};END{printf "%s\n",v}' /scripts/.env)
LUNE_ID=$(awk -F '=' 'function t(s){gsub(/[[:space:]]/,"",s);return s};/^LUNE_ID/{v=t($2)};END{printf "%s\n",v}' /scripts/.env)

# Use awk to find the values and write them to the output file
awk -v RS=',|\n' '{print NR, $0}' "$FILE" > "$OUTPUT"

# Find raw number from output file
OUTPUT_CSV=$(cat /scripts/output.txt | grep "\\\\\\\\$ESXI_NAME\\\\Physical Disk SCSI Device($LUNE_ID)\\\\Average Kernel MilliSec/Command" | awk "{print \$1}" | head -n 1)

# Get KAVG param from CSV.

while read -r line; do
        fst=$(echo "$line" | cut -d ',' -f $OUTPUT_CSV | awk -F'"' '{print $2}')
        echo "$(date '+%d-%m-%Y %H:%M:%S') - $fst"
done < "$FILE" | sed -n '2p'

