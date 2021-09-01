#!/bin/bash

source 'colors.sh'

# Outputs a blank line.
function linefeed {
  echo
}

# Outputs the provided string as a status message without any particular color.
function write {
  echo "$1"
}

# Outputs the provided string as a success status message.
function success {
  echo -e "${GREEN}$1${NO_COLOR}"
}

# Outputs the provided string as an error status message.
function error {
  echo -e "${RED}$1${NO_COLOR}"
}
