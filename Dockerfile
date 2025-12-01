FROM n8nio/n8n:latest

# Optional: set timezone
ENV GENERIC_TIMEZONE=Asia/Bangkok

# n8n listens on 5678 by default
EXPOSE 5678

# Copy workflow JSON into the image
COPY workflow.json /workflow.json

# Custom entrypoint that imports the workflow then starts n8n
COPY docker-entrypoint.sh /docker-entrypoint-custom.sh
RUN chmod +x /docker-entrypoint-custom.sh

# Use our custom entrypoint
ENTRYPOINT ["/docker-entrypoint-custom.sh"]
