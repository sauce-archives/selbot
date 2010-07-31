Create a searchable log repository for #selenium on freenode.

Requirements
============

* Supybot for IRC logging
    - `install-bot.sh`
* xapian for indexing
    - `install-xapian.sh`
* lighttpd for web server
    - `aptitude install lighttpd`

Setup
=====

* This was done in a hurry and is very messy, I'll clean it up later
* Everything runs under the user "selenium"
* Fix paths (on new machine)
    - Make sure all paths in lighttpd.conf and selbot.conf are correct
* Change lighttpd global config to point here
    - `ln -s $PWD/lighttpd.conf /etc/lighttpd/lighttpd.conf`
* Create a link for /irc/logs
    - See create-omega-link.sh
* Restart lighttpd
* Run the bot
    - run-bot.sh
* Edit cron to run the bot on startup and index every 10 min
    - see ./crontab

HACKS
=====

* I had to patch the ChannelLogger to not use the # prefix for log file names
  (Didn't manage to write a rewrite rule for lighttpd to do that)::

    supybot/plugins/ChannelLogger/plugin.py

    def getLogName(self, channel):
        channel = channel[1:] # Remove the #
        if self.registryValue('rotateLogs', channel):
            return '%s.%s.log' % (channel, self.logNameTimestamp(channel))
        else:
            return '%s.log' % channel

