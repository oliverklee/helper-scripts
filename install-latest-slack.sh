#!/bin/bash

#
# Unconditionally installs the latest version of Slack (independent of whether it is already installed or not).
#

SLACK_PATH='/tmp/slack-desktop-latest.deb'
wget -q https://slack.com/downloads/instructions/linux?build=deb -O - \
| tr "\t\r\n'" '   "' \
| grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' \
| sed -e 's/^.*"\([^"]\+\)".*$/\1/g' \
| grep 'slack-desktop' \
| xargs wget -q -O "${SLACK_PATH}"
sudo apt install -y "${SLACK_PATH}"
rm "${SLACK_PATH}"
success 'Done.'
