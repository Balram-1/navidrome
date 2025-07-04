FROM deluan/navidrome:latest

# Install rclone
RUN apk add --no-cache curl unzip && \
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp rclone-*-linux-amd64/rclone /usr/bin/ && \
    chmod 755 /usr/bin/rclone && \
    rm -rf rclone-*-linux-amd64*

# Copy config and startup script
RUN mkdir -p /etc/rclone
COPY rclone.conf /etc/rclone/rclone.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Replace CMD with your script
CMD ["/start.sh"]
