#!/bin/bash
set -e

# Ensure /music exists
mkdir -p /music

# Start background sync loop: sync every 60 seconds
while true; do
    echo "Syncing music from Google Drive..."
    rclone sync gdrive:music /music --create-empty-src-dirs --fast-list
    sleep 60
done &

# Start Navidrome
/opt/navidrome --musicfolder /music --datafolder /data --cachefolder /cache --port 4533
