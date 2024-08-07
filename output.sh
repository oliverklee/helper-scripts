#!/bin/bash

#
# This file provides functions for outputting colored status messages.
#

source 'colors.sh'

# Outputs a blank line.
function linefeed {
  echo
}

# Outputs the provided string as a success status message.
function success {
  echo -e "${GREEN}$1${COLOR_OFF}"
}

# Outputs the provided string as an error status message.
function error {
  echo -e "${RED}$1${COLOR_OFF}"
}

# Outputs the provided string as a notice status message.
function notice {
  echo -e "${YELLOW}$1${COLOR_OFF}"
}
