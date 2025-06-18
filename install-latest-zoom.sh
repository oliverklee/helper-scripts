#!/bin/bash

#
# Unconditionally installs the latest version of Zoom (independent of whether it is already installed or not).
#
# The redirect target URL follows this pattern: https://cdn.zoom.us/prod/6.4.6.1370/zoom_amd64.deb
#

ZOOM_PATH='/tmp/zoom_amd64.deb'
# The URL is a redirect. So we need to use -L to follow it.
curl -L 'https://zoom.us/client/latest/zoom_amd64.deb' --output "${ZOOM_PATH}"
sudo apt install -y "${ZOOM_PATH}"
rm "${ZOOM_PATH}"
success 'Done.'
