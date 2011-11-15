#!/bin/bash
today=`date +"%m-%y"`
markdown2 "/home/chansen4/Dropbox/life/logs/journal/${today}.text" > /tmp/journal.html;
echo "<style type='text/css'>h1 {margin: 0 auto; width: 700px; margin-top: 35px; margin-bottom: 15px;} p {width: 700px; margin: 0 auto; margin-bottom: 10px;} blockquote {color: gray; font-style: italic; padding-left: 25px;}</style>" >> /tmp/journal.html
google-chrome /tmp/journal.html
