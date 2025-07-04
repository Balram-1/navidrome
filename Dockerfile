FROM debian:bullseye-slim

# Install rclone and Navidrome
RUN apt-get update && apt-get install -y curl fuse && \
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.deb && \
    dpkg -i rclone-current-linux-amd64.deb && \
    curl -L https://github.com/navidrome/navidrome/releases/download/v0.57.0/navidrome_0.57.0_linux_amd64.tar.gz | tar xz -C /opt

# Copy rclone.conf
COPY rclone.conf /root/.config/rclone/rclone.conf

# Entrypoint script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
