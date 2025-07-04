#!/bin/bash
rclone mount gdrive:music /music --daemon
sleep 5
/opt/navidrome --musicfolder /music --port 4533
