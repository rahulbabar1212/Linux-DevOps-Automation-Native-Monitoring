#!/bin/bash
# Description: Audits CPU, Memory, and Disk usage. Captures top processes during spikes.

LOG_FILE="/var/log/sys_monitor.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# 1. Disk Space Check (Root Partition)
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
if [ "$DISK_USAGE" -gt 80 ]; then
    echo "[$TIMESTAMP] [CRITICAL] Disk usage high: ${DISK_USAGE}%" >> "$LOG_FILE"
fi

# 2. Memory Utilization Check
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')
if [ "$MEM_USAGE" -gt 90 ]; then
    echo "[$TIMESTAMP] [WARNING] Memory usage high: ${MEM_USAGE}%" >> "$LOG_FILE"
    echo "[$TIMESTAMP] Top 5 Memory-consuming processes:" >> "$LOG_FILE"
    ps aux --sort=-%mem | head -n 6 >> "$LOG_FILE"
fi
