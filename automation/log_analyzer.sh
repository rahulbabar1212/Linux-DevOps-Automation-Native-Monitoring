#!/bin/bash
# Description: Quickly parses log files to count and display recent errors.

TARGET_LOG="${1:-/var/log/syslog}"

if [ ! -f "$TARGET_LOG" ]; then
    echo "Error: File $TARGET_LOG not found."
    exit 1
fi

echo "=========================================="
echo " LOG ANALYSIS REPORT: $TARGET_LOG"
echo " Date: $(date)"
echo "=========================================="

ERROR_COUNT=$(grep -ci "error" "$TARGET_LOG")
CRIT_COUNT=$(grep -ci "critical" "$TARGET_LOG")
WARN_COUNT=$(grep -ci "warning" "$TARGET_LOG")

echo "Total Errors:    $ERROR_COUNT"
echo "Total Criticals: $CRIT_COUNT"
echo "Total Warnings:  $WARN_COUNT"

echo "------------------------------------------"
echo "Last 5 ERROR Entries:"
grep -i "error" "$TARGET_LOG" | tail -n 5
echo "=========================================="
