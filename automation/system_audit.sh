#!/bin/bash
# Description: Generates a high-level server health report.

echo "=========================================="
echo "        SYSTEM AUDIT REPORT               "
echo "=========================================="
echo "Hostname:     $(hostname)"
echo "Uptime:       $(uptime -p)"
echo "Kernel Ver:   $(uname -r)"
echo "Active Users: $(who | wc -l)"
echo "------------------------------------------"
echo "Memory Status (MB):"
free -m
echo "------------------------------------------"
echo "Disk Utilization:"
df -h /
echo "------------------------------------------"
echo "Listening Network Ports:"
ss -tulnp | grep LISTEN | head -n 5
echo "=========================================="
