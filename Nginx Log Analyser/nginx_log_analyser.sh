#!/bin/bash

COUNTS=5

LOG_FILE="nginx-access.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: $LOG_FILE not found"
    exit 1
fi

echo -e "\nTop ${COUNTS} IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr |awk '{print $2 " - " $1 " requests"}' | head -n ${COUNTS}

echo -e "\nTop ${COUNTS} most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr |awk '{print $2 " - " $1 " requests"}' | head -n ${COUNTS}

echo -e "\nTop ${COUNTS} response status codes:"
grep -oE ' [1-5][0-9]{2} ' "$LOG_FILE" | sort | uniq -c | sort -rn | awk '{print $2 " - " $1 " requests"}' |  head -n $COUNTS 
