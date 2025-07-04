#!/bin/sh

# Sync music from GDrive to local
rclone copy gdrive:/music /data/music --create-empty-src-dirs --drive-acknowledge-abuse=true --transfers=4 --checkers=8 --drive-chunk-size=64M

# Start navidrome
/navidrome
