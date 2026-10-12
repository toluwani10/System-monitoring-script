#!/bin/bash
echo "checking cpu usage." 
CPU_Usage=$(top -bn1 | grep "%Cpu(s)" | sed 's/,/ /g' | awk '{print 100 - $8}') 
Threshold=80 
if awk -v cpu="$CPU_Usage" -v limit="$Threshold" 'BEGIN { exit !(cpu > limit) }'
then
    echo "CPU usage is above threshold: ${CPU_Usage}%"
else
   echo "CPU usage is below threshold: ${CPU_Usage}%"
fi
#memory monitoring
echo "checking memory usage."
Memory_Usage=$(free | grep Mem | awk '{printf "%.2f", $3/$2 * 100.0}')
Threshold=80
if awk -v mem="$Memory_Usage" -v limit="$Threshold" 'BEGIN { exit !(mem > limit) }'
then
    echo "Memory usage is above threshold: ${Memory_Usage}%"
else
    echo "Memory usage is below threshold: ${Memory_Usage}%"
fi
#disk monitoring
echo "checking disk usage."
DISK_USAGE=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')
Threshold=80
if [ "$DISK_USAGE" -gt "$Threshold" ]; then
   echo "WARNING: High disk usage: ${DISK_USAGE}%"
else
    echo "Disk usage is normal: ${DISK_USAGE}%"
fi
