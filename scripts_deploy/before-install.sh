#!/bin/bash
set -e

# Stop and remove any existing containers
docker-compose -f docker-compose-common.yml -f docker-compose-${DEPLOY_TARGET_ENV}.yml down || true

# Remove unused images and volumes
docker system prune -af

