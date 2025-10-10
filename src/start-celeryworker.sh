#!/bin/bash

set -o errexit
set -o nounset

celery -A config.celery_app worker \
    --loglevel=INFO \
    --pool=prefork \
    --concurrency=4 \
    --without-gossip \
    --without-mingle \
    --without-heartbeat

