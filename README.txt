Create a searchable log repository for #selenium on freenode.

Requirements:
* Supybot for IRC logging
    - install-bot.sh
* xapian for indexing
    - install-xapian.sh
* lighttpd for web server
    - aptitude install lighttpd

HACKS:
* I had to patch the ChannelLogger to not use the # prefix for log file names
  (Didn't manage to write a rewrite rule for lighttpd to do that)

    supybot/plugins/ChannelLogger/plugin.py

    def getLogName(self, channel):
        channel = channel[1:] # Remove the #
        if self.registryValue('rotateLogs', channel):
            return '%s.%s.log' % (channel, self.logNameTimestamp(channel))
        else:
            return '%s.log' % channel

