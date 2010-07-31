#!/bin/bash

cd $(dirname $0)

start() {
    . ircbot/bin/activate
    supybot -d selbot.conf
}

stop() {
    if [ -f selbot.pid ]; then
        ./kill $(cat selbot.pid)
    fi
}

usage="usage: $(basename $0) start|stop|restart"

if [ $# -ne 1 ]; then
    echo $usage
    exit 1
fi

case $1 in
    -h | --help ) echo $usage; exit;;
    start ) start;;
    stop ) stop;;
    restart ) stop; start;;
    * ) echo "error: unknown command $1"; exit 1;;
esac
