#!/bin/sh

# Import workflow if not already imported
if [ -f /workflow.json ]; then
    echo "Importing workflow..."
    n8n import:workflow --input=/workflow.json || true
fi

# Start n8n normally
exec n8n
