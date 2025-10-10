#!/bin/bash
set -e

# Stop the application
docker-compose -f docker-compose-common.yml -f docker-compose-${DEPLOY_TARGET_ENV}.yml down || true

