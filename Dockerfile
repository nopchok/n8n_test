FROM n8nio/n8n:latest

# Optional: set timezone
ENV GENERIC_TIMEZONE=Asia/Bangkok

# Create directory for n8n data (Fly will mount a volume here)
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

USER node

# n8n listens on 5678 by default
EXPOSE 5678

CMD ["n8n"]
