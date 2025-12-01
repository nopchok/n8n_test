FROM n8nio/n8n:latest

USER root

# Copy workflow to a separate directory to avoid being hidden by volume mount at /data
COPY workflow.json /files/workflow.json

WORKDIR /data

EXPOSE 5678

CMD ["sh", "-c", "n8n import:workflow --input=/files/workflow.json && n8n"]