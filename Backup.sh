#!/bin/bash

backup_dir="/tmp/backups"
backup_file="$backup_dir/backup_$(date +%Y%m%d).tar.gz"

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Perform the backup
tar -cvzf "$backup_file" /etc /var

# Check if the backup file was created
if [ -f "$backup_file" ]; then
    echo "Backup was created"
    gzip "$backup_file"
    echo "Archiving backup"
    # scp "$backup_file.gz" root@ip:/path
else
    echo "Backup failed"
fi
