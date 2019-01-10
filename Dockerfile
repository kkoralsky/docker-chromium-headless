FROM alpine:3.7


RUN apk add --no-cache chromium nodejs && \
    adduser -D -h /app chromium && \
    rm -rf /var/cache/apk/* 

VOLUME ["/app"]
USER chromium
WORKDIR "/app"
ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

ENTRYPOINT ["chromium-browser", "--headless", "--disable-gpu", "--disable-software-rasterizer", "--disable-dev-shm-usage"]
CMD ["--no-sandbox"]
