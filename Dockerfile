FROM deluan/navidrome:latest

# Install rclone
RUN apt-get update && apt-get install -y curl unzip && \
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp rclone-*-linux-amd64/rclone /usr/bin/ && \
    chmod 755 /usr/bin/rclone && \
    rm -rf rclone-*-linux-amd64*

# Copy rclone config
RUN mkdir -p /etc/rclone
COPY rclone.conf /etc/rclone/rclone.conf

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Use custom start script
CMD ["/start.sh"]
