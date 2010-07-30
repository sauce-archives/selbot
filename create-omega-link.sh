#!/bin/bash
# Make symbolic links to create working environment

cd $(dirname $0)

ln -s /usr/lib/cgi-bin/omega/omega index.cgi
root=$PWD
mkdir irc
(cd irc && ln -s $root/logs/ChannelLogger logs)
