#!/bin/bash

# Exit on 1'st error
set -e

sudo aptitude install -y xapian-omega xapian-tools python-setuptools lighttpd
sudo easy_install pip

envdir=ircbot
if [ ! -e $envdir ]; then
    virtualenv $envdir
fi
. $envdir/bin/activate

wget 'http://downloads.sourceforge.net/project/supybot/supybot/Supybot-0.83.4.1/Supybot-0.83.4.1.zip?use_mirror=softlayera'
unzip Supybot-0.83.4.1.zip
pip install Supybot-0.83.4.1.zip

patch -p1 < plugin.diff

# Add directories
mkdir data
mkdir tmp
mkdir -p logs/ChannelLogger
mkdir plugins


# Make symbolic links to create working environment
ln -s /usr/lib/cgi-bin/omega/omega index.cgi
root=$PWD
mkdir irc
(cd irc && ln -s $root/logs/ChannelLogger logs)

date=$(date +%Y%m%d-%H%M%S)
sudo /etc/init.d/lighttpd stop
sudo mv /etc/lighttpd/lighttpd.conf /etc/lighttpd/lighttpd.conf.orig.$date
sudo ln -s $PWD/lighttpd.conf /etc/lighttpd/lighttpd.conf
sudo /etc/init.d/lighttpd start
