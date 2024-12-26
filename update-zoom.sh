#!/bin/bash

# Checks Zoom for updates and installs them if available.
# This script assumes that Zoom is installed via the official .deb package.
#
# This script was inspired by: https://github.com/pazepaze/zoom-autoupdater/blob/master/autoupdate-zoom.sh

ZOOM_VERSION_INSTALLED=$(dpkg -s zoom | sed -n -e 's/Version: //p')
echo "Zoom version installed: ${ZOOM_VERSION_INSTALLED}"
ZOOM_VERSION_AVAILABLE=$(curl -s 'https://zoom.us/rest/download?os=linux' | jq '.result.downloadVO.zoom.version' | tr -d '"')
echo "Zoom version available for download: ${ZOOM_VERSION_AVAILABLE}"
if [[ "$ZOOM_VERSION_INSTALLED" != "$ZOOM_VERSION_AVAILABLE" ]]; then
  echo 'Downloading new version …'
  source 'install-latest-zoom.sh'
else
  echo 'Zoom is up to date.'
fi

unset ZOOM_VERSION_AVAILABLE ZOOM_VERSION_INSTALLED
