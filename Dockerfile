FROM n8nio/n8n:latest

# Optional: set timezone
ENV GENERIC_TIMEZONE=Asia/Bangkok

# n8n listens on 5678 by default
EXPOSE 5678

# Copy workflow JSON into the image
COPY workflow.json /workflow.json

# Copy custom entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Use our custom entrypoint instead of default
ENTRYPOINT ["/docker-entrypoint.sh"]
