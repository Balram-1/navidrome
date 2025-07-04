#!/bin/sh

# Mount Google Drive using rclone
echo "Mounting Google Drive..."
rclone mount gdrive:/Navidrome /music --daemon

# Start Navidrome (reads from /music)
echo "Starting Navidrome..."
/app/navidrome
