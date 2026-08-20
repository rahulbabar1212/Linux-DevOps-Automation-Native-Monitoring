#!/bin/bash
# Description: Monitors target service (Nginx) and automatically triggers restart on failure.

SERVICE="nginx"
LOG_FILE="/var/log/service_healer.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if ! systemctl is-active --quiet "$SERVICE"; then
    echo "[$TIMESTAMP] [ALERT] $SERVICE service down. Initiating restart..." >> "$LOG_FILE"
    systemctl restart "$SERVICE"
    sleep 5

    if systemctl is-active --quiet "$SERVICE"; then
        echo "[$TIMESTAMP] [RECOVERY SUCCESS] $SERVICE restored successfully." >> "$LOG_FILE"
    else
        echo "[$TIMESTAMP] [RECOVERY FAILED] $SERVICE failed to restart. Escalation needed." >> "$LOG_FILE"
    fi
fi
