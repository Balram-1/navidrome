#!/bin/bash

echo "Mounting Google Drive using rclone..."
rclone mount gdrive: /music --allow-other --daemon

echo "Starting Navidrome..."
/app/navidrome
