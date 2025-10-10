#!/bin/bash

set -o errexit
set -o nounset

celery -A config.celery_app flower \
    --port=5555 \
    --basic_auth="${CELERY_FLOWER_USER}:${CELERY_FLOWER_PASSWORD}" \
    --broker="${CELERY_BROKER_URL}"

