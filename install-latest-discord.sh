#!/bin/bash

#
# Unconditionally installs the latest version of Discord (independent of whether it is already installed or not).
#

DISCORD_PATH='/tmp/discord.deb'
# The URL is a redirect. So we need to use -L to follow it.
curl -L 'https://discord.com/api/download?platform=linux&format=deb' --output "${DISCORD_PATH}"
sudo apt install -y "${DISCORD_PATH}"
rm "${DISCORD_PATH}"
success 'Done.'
