#!/bin/bash

# Mount GDrive with rclone and start Navidrome
rclone mount gdrive: /music --daemon

# Start Navidrome (adjust path if needed)
./navidrome
