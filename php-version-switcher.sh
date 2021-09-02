#!/bin/bash

#
# Functions for switching between PHP versions on an installation that uses
# Apache and mod_php.
#

source 'output.sh'

# Switches to the provided PHP versions, disables the Apache modules for all
# other versions, and restarts Apache.
function switch_to_php_version {
  ensure_apache

  PHP_VERSIONS=$(update-alternatives --list php | cut -b 13-15 )

  ensure_php_version_is_installed "$1"
  disable_other_mods "$1"
  enable_mod "$1"

  switch_php_alternative "$1"
}

# Ensures that Apache 2 is installed.
function ensure_apache {
  if [ $(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    error 'The package "apache2" is not installed. In this case, this script is not for your.'
    exit 1
  fi
}

# Ensures that the given version of PHP actually is installed.
function ensure_php_version_is_installed {
  if [ -z $(echo "${PHP_VERSIONS}" | grep "${1}") ]; then
    error "The php version $1 is not available. Available versions on this system are:"
    echo "${PHP_VERSIONS}"
    exit 1;
  fi
}

# Disables mod_php for all PHP versions except for the given version.
function disable_other_mods {
  echo 'Disabling mod_php for all other PHP versions …'
  for php_version in ${PHP_VERSIONS}; do
    if [ "${php_version}" != "$1" ]; then
      sudo a2dismod "php${php_version}"
    fi
  done
  success 'Done.'
  linefeed
}

# Enables mod_php for the given PHP version and restarts Apache.
function enable_mod {
  echo "Enabling mod_php for PHP ${1} …"
  sudo a2enmod "php{$1}"
  sudo service apache2 restart
  success 'Done.'
  linefeed
}

# Switches the "php" executable to the given version.
function switch_php_alternative {
  echo "Switching the PHP executable to version $1 …"
  sudo update-alternatives --set php "/usr/bin/php${1}"
  success 'Done.'
}