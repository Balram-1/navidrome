FROM debian:bullseye-slim

# Install required tools
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    fuse \
 && rm -rf /var/lib/apt/lists/*

# Install rclone
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp rclone-*-linux-amd64/rclone /usr/bin/ && \
    chmod 755 /usr/bin/rclone && \
    rm -rf rclone-*

# Add rclone config
RUN mkdir -p /root/.config/rclone
COPY rclone.conf /root/.config/rclone/rclone.conf

# Download and install Navidrome (correct release version)
ENV NAVIDROME_VERSION=0.52.4

RUN curl -L https://github.com/navidrome/navidrome/releases/download/v${NAVIDROME_VERSION}/navidrome_${NAVIDROME_VERSION}_linux_amd64.tar.gz -o navidrome.tar.gz && \
    mkdir -p /app && \
    tar -xzf navidrome.tar.gz --strip-components=1 -C /app && \
    chmod +x /app/navidrome && \
    rm navidrome.tar.gz

# Create music folder
RUN mkdir -p /music

# Add startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
