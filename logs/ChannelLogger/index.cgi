#!/usr/bin/env python
# Print list of files in descending order
# HTML template copied from lighttpd dirlist mode

from os.path import abspath, dirname, getmtime, getsize, basename
from glob import glob
from time import strftime, localtime

print '''
<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title>Index of /irc/logs/</title>
<style type="text/css">
a, a:active {text-decoration: none; color: blue;}
a:visited {color: #48468F;}
a:hover, a:focus {text-decoration: underline; color: red;}
body {background-color: #F5F5F5;}
h2 {margin-bottom: 12px;}
table {margin-left: 12px;}
th, td { font: 90% monospace; text-align: left;}
th { font-weight: bold; padding-right: 14px; padding-bottom: 3px;}
td {padding-right: 14px;}
td.s, th.s {text-align: right;}
div.list { background-color: white; border-top: 1px solid #646464; border-bottom: 1px solid #646464; padding-top: 10px; padding-bottom: 14px;}
div.foot { font: 90% monospace; color: #787878; padding-top: 4px;}
</style>
</head>
<body>
<h2>Index of /irc/logs/</h2>
<div class="list">
<table summary="Directory Listing" cellpadding="0" cellspacing="0">
<thead><tr><th class="n">Name</th><th class="m">Last Modified</th><th class="s">Size</th><th class="t">Type</th></tr></thead>

<tbody>
'''

logdir = dirname(abspath(__file__))
for name in sorted(glob("%s/*.log" % logdir), reverse=True):
    size = "%0.1f" % (getsize(name) / 1024.0)
    modified = strftime("%Y-%b-%d %H:%M:%S", localtime(getmtime(name)))
    name = basename(name)

    print '''<tr>
                <td class="n"><a href="%s">%s</a></td>
                <td class="m">%s</td>
                <td class="s">%sK</td>
                <td class="t">text/plain</td>
                </tr>''' % (name, name, modified, size)

print '''</tbody>
</table>
</div>
<div class="foot">lighttpd/1.4.26</div>
</body>
</html>'''
