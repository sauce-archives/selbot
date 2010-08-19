======================================================
A searchable log repository for #selenium on freenode.
======================================================


:Author: Miki Tebeka <miki@saucelabs.com>


Setup
=====
* Everything runs under the user "selenium"
* Fix paths (on new machine)
    - Make sure all paths in lighttpd.conf and selbot.conf are correct
* Run `install.sh` (you'll need sudo rights)
* Run the bot
    - selbot.sh start
* Edit cron to run the bot on startup and index every 10 min
    - see ./crontab

TODO
====
* Automatically generate the right paths in lighttpd.conf and selbot.conf
* Make the search template (`omega-templates/query`) nicer
* Commit selbot.conf from time to time, the bot can be configured from the IRC
  channel

HACKS
=====
* I had to patch the ChannelLogger to not use the # prefix for log file names
    * See `plugin.diff` (this is automated in `install.sh`)

License
=======
Apache (see LICENSE.txt)
