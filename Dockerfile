FROM deluan/navidrome:latest

USER root

# Install curl and unzip using Alpine's apk
RUN apk update && apk add --no-cache curl unzip

# Download and install rclone
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp rclone-*-linux-amd64/rclone /usr/bin/ && \
    chmod 755 /usr/bin/rclone && \
    rm -rf rclone-*-linux-amd64*

# Create music folder
RUN mkdir -p /music
ENV MUSIC_FOLDER=/music
ENV RCLONE_CONFIG=/etc/rclone/rclone.conf

# Change back to the non-root user
USER 1000

# Final entrypoint: Sync music from GDrive and start Navidrome
ENTRYPOINT rclone copy gdrive:/Navidrome /music && /app/navidrome
