FROM deluan/navidrome:latest

# Install rclone
USER root
RUN apt-get update && apt-get install -y curl unzip && \
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp rclone-*-linux-amd64/rclone /usr/bin/ && \
    chmod 755 /usr/bin/rclone && \
    rm -rf rclone-*-linux-amd64*

# Set up working directory and rclone config location
ENV RCLONE_CONFIG=/etc/rclone/rclone.conf

# Create music folder
RUN mkdir -p /music
ENV MUSIC_FOLDER=/music

# Copy your rclone config file (you'll need to mount or bake it in during build or manually copy)
# Example only — you'd provide the real config in a secure way (like Render env or during Docker build)
# COPY rclone.conf /etc/rclone/rclone.conf

# Change back to non-root user Navidrome expects
USER 1000

# Copy music from Google Drive and then run Navidrome
ENTRYPOINT rclone copy gdrive:/Navidrome /music && /app/navidrome
