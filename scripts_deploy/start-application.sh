#!/bin/bash
set -e

# Start the application
docker-compose -f docker-compose-common.yml -f docker-compose-${DEPLOY_TARGET_ENV}.yml up -d

# Wait for services to be healthy
echo "Waiting for services to be healthy..."
sleep 30

