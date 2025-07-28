#!/bin/sh

# Set up Elasticsearch
echo "Setting up Elasticsearch..."
/app/setup_es.sh --index-dir /app/es_index_schemas

# Start the proxy application in the background
echo "Starting proxy application..."
/app/proxy >/tmp/proxy.log 2>&1 &
echo "Proxy application started in background."

# Start the main application in the foreground
echo "Starting main application..."
/app/opencoze
echo "Main application exited."
