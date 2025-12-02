#!/bin/bash
# Name: config_backup.sh
# Description: Creates a compressed backup of config files and removes archives older than 7 days (Rotation).

# Configuration
SOURCE_DIR="/etc"                    # Directory to backup (Example: /etc)
BACKUP_DIR="/home/user/backups"      # Destination directory (Change 'user' to your username)
CURRENT_DATE=$(date "+%Y%m%d_%H%M%S")
FILENAME="backup_configs_$CURRENT_DATE.tar.gz"

# Create destination directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

echo "Starting backup of $SOURCE_DIR..."

# Create the compressed archive (suppressing error output)
tar -czf "$BACKUP_DIR/$FILENAME" "$SOURCE_DIR" 2> /dev/null

if [ $? -eq 0 ]; then
    echo "Success! Backup created at: $BACKUP_DIR/$FILENAME"
else
    echo "Error: Backup creation failed."
    exit 1
fi

# Remove backups older than 7 days to save space
find "$BACKUP_DIR" -name "backup_configs_*.tar.gz" -mtime +7 -exec rm {} \;
echo "Cleanup of old backups completed."
