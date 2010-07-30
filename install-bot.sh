#!/bin/bash

# Install supybot on local environment

set -e

envdir=ircbot
if [ ! -e $envdir ]; then
    virtualenv $envdir
fi
. $envdir/bin/activate
easy_install pip

wget 'http://downloads.sourceforge.net/project/supybot/supybot/Supybot-0.83.4.1/Supybot-0.83.4.1.zip?use_mirror=softlayera'
unzip Supybot-0.83.4.1.zip
pip install Supybot-0.83.4.1.zip

# Add directories
mkdir data
mkdir tmp
mkdir -p logs/ChannelLogger
mkdir plugins
