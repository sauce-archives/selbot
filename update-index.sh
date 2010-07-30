#!/bin/bash

# Index documents, to be called from cron job

cd $(dirname $0)
omindex \
    --db default \
    --url /irc/logs \
    -M log:text/plain \
    logs/ChannelLogger
