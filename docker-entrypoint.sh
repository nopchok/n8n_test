#!/bin/sh
set -e

# Import workflow if the file exists
if [ -f /workflow.json ]; then
  echo "Importing workflow from /workflow.json..."
  n8n import:workflow --input=/workflow.json || echo "Import failed (maybe already imported). Continuing..."
fi

# Call the original n8n entrypoint script from the base image
exec docker-entrypoint.sh "$@"
