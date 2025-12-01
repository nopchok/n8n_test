FROM node:lts-alpine

# pass N8N_VERSION Argument while building or use default
ARG N8N_VERSION=1.39.1

# Update everything and install needed dependencies
RUN apk add --update graphicsmagick tzdata

# Set a custom user to not have n8n run as root
USER root

# Install n8n and also all temporary packages
# it needs to build it correctly.
RUN apk --update add --virtual build-dependencies python3 build-base && \
	npm_config_user=root npm install --location=global n8n@${N8N_VERSION} && \
	apk del build-dependencies

# Specifying work directory
WORKDIR /data

# define execution entrypoint
COPY workflow.json /data/workflow.json
EXPOSE 5678
CMD ["sh", "-c", "n8n import:workflow --input=/data/workflow.json && n8n"]