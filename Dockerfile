FROM debian:bullseye-slim

# Install dependencie
RUN apt-get update && \
    apt-get install -y curl ffmpeg unzip && \
    # Install rclone
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.deb && \
    dpkg -i rclone-current-linux-amd64.deb && \
    # Install Navidrome
    curl -L https://github.com/navidrome/navidrome/releases/download/v0.57.0/navidrome_0.57.0_linux_amd64.tar.gz | tar xz -C /opt && \
    rm -rf /var/lib/apt/lists/* rclone-current-linux-amd64.deb

# Create music and cache directories
RUN mkdir -p /music /data /cache

# Copy rclone config (make sure to add your rclone.conf in the build context)
COPY rclone.conf /root/.config/rclone/rclone.conf

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose Navidrome port
EXPOSE 4533

CMD ["/start.sh"]
