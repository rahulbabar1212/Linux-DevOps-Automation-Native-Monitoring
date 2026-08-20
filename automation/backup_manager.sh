#!/bin/bash
# Description: Archives and compresses target directories with dynamic date stamping.

SOURCE_DIR="/var/log"
BACKUP_DIR="/var/backups/logs"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="log_backup_${DATE}.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "[INFO] Starting backup of $SOURCE_DIR..."
tar -czf "${BACKUP_DIR}/${BACKUP_FILE}" "$SOURCE_DIR" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "[SUCCESS] Backup saved to ${BACKUP_DIR}/${BACKUP_FILE}"
else
    echo "[ERROR] Backup failed!"
    exit 1
fi
