# Use a minimal base image
FROM alpine:latest

# Install dependencies and rclone
RUN apk add --no-cache curl unzip bash && \
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp rclone-*-linux-amd64/rclone /usr/bin/ && \
    chmod 755 /usr/bin/rclone && \
    rm -rf rclone-*-linux-amd64*

# Add rclone config
RUN mkdir -p /etc/rclone
COPY rclone.conf /etc/rclone/rclone.conf

# Copy your start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set entrypoint to start.sh (THIS IS THE FIX)
ENTRYPOINT ["/start.sh"]
