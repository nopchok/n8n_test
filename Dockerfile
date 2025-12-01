FROM n8nio/n8n:latest

# Optional: set timezone
ENV GENERIC_TIMEZONE=Asia/Bangkok

# n8n listens on 5678 by default
EXPOSE 5678

# Copy workflow JSON into the image
COPY workflow.json /workflow.json

# Copy our custom entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint-custom.sh

# Important: no chmod here

# Use tini (like the base image) but run our script via sh
ENTRYPOINT ["tini", "--", "sh", "/docker-entrypoint-custom.sh"]
