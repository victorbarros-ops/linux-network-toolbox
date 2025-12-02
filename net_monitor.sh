#!/bin/bash
# Name: net_monitor.sh
# Description: Tests connectivity for a list of IP addresses

# Configuration Files
IP_LIST_FILE="ip_list.txt"
LOG_FILE="connectivity_monitor.log"
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Start logging
echo "--- Starting Test: $CURRENT_DATE ---" >> $LOG_FILE

# Check if the IP list file exists
if [ ! -f "$IP_LIST_FILE" ]; then
    echo "Error: File $IP_LIST_FILE not found!"
    exit 1
fi

# Loop through each IP in the list
while read -r IP; do
    # Ping only once (-c 1) and wait max 1 second (-W 1)
    ping -c 1 -W 1 "$IP" > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo "[$CURRENT_DATE] $IP - ONLINE" | tee -a $LOG_FILE
    else
        echo "[$CURRENT_DATE] $IP - OFFLINE (Alert!)" | tee -a $LOG_FILE
    fi
done < "$IP_LIST_FILE"
