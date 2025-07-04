#!/bin/sh
# Mount GDrive to /music
rclone mount gdrive:/Navidrome /music --daemon

# Start Navidrome
/app/navidrome
