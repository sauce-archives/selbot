#!/bin/bash

# Index documents, to be called from cron job

cd $(dirname $0)
omindex \
    --db default \
    --url /logs/ChannelLogger \
    -M log:text/plain \
    'logs/ChannelLogger'
