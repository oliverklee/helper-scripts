#!/bin/bash

#
# This file provides helper functions for working with git.
#

source 'output.sh'

# Ensures that there is a git repository in the current directory.
function ensure_git {
  inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
  if [ ! "$inside_git_repo" ]; then
    error 'The current directory is no git repository.'
    exit 1
  fi
}

# Ensures that the working directory is clean.
function ensure_clean_working_directory {
  write 'Checking if the working tree is clean …'
  if [ -n "$(git status --porcelain)" ]; then
    error 'There are uncommitted changes:'
    linefeed
    git status
    exit 1;
  else
    success 'Clean.'
    linefeed
  fi
}

# Ensures that the given remote exists.
function ensure_remote_exists {
  if ! git config "remote.$1.url" > /dev/null; then
    error "Remote \"$1\" is not defined."
    exit 1
  fi
}
