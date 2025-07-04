FROM deluan/navidrome:latest

# Install rclone
RUN apt-get update && apt-get install -y curl unzip && \
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp rclone-*-linux-amd64/rclone /usr/bin/ && \
    chmod 755 /usr/bin/rclone && \
    rm -rf rclone-*-linux-amd64*

# Copy rclone.conf into container
COPY rclone.conf /app/rclone.conf

# Set ENV so rclone uses the custom config
ENV RCLONE_CONFIG=/app/rclone.conf
