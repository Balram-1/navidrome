FROM deluan/navidrome:latest

# Install rclone dependencies on Alpine
RUN apk add --no-cache curl unzip fuse3

# Install rclone
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp rclone-*-linux-amd64/rclone /usr/bin/ && \
    chmod 755 /usr/bin/rclone && \
    rm -rf rclone-*-linux-amd64*

# Copy rclone config
RUN mkdir -p /etc/rclone
COPY rclone.conf /etc/rclone/rclone.conf

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Entry point
CMD ["/start.sh"]
