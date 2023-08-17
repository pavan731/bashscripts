#!/bin/bash

# Target directory to clean
target_dir="/home/ubuntu/path/to/source1"

# i will set the threshold date (files older than this will be deleted)
threshold_date=$(date -d "7 days ago" +%Y%m%d)  # Change to your desired threshold date

# Remove files older than the threshold date
find "$target_dir" -type f -name "*.log" -mtime +$threshold_date -exec rm {} \;
