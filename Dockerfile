RUN curl -fL https://github.com/navidrome/navidrome/releases/download/v0.57.0/navidrome_0.57.0_linux_amd64.tar.gz -o navidrome.tar.gz && \
    mkdir -p /app && \
    tar -xzf navidrome.tar.gz --strip-components=1 -C /app && \
    chmod +x /app/navidrome && \
    rm navidrome.tar.gz
