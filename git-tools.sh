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

# Ensures that the "origin" remote exists.
function ensure_origin_exists {
  write 'Checking that the "origin" remote exists …'
  ensure_remote_exists 'origin'
  success 'Okay.'
  linefeed
}

# Determines the default branch puts it in the constant "GIT_BRANCH".
function determine_default_branch {
  write 'Determining the default branch …'

  MAIN_PRESENT=$(branch_exists 'main')
  if [ -n "${MAIN_PRESENT}" ]; then
    write '"main" branch present: yes'
    GIT_BRANCH='main'
  else
    write '"main" branch present: no'
  fi;
  MASTER_PRESENT=$(branch_exists 'master')
  if [ -n "${MASTER_PRESENT}" ]; then
    write '"master" branch present: yes'
    GIT_BRANCH='master'
  else
    write '"master" branch present: no'
  fi;

  if [ -z "${MAIN_PRESENT}${MASTER_PRESENT}" ]; then
    error 'Neither a "main" nor a "master" branch are present. Existing branches:'
    git branch
    exit 1
  fi
  if [ -n "${MAIN_PRESENT}" ] && [ -n "${MASTER_PRESENT}" ]; then
    error 'Both a "main" nor a "master" branch are present. There can only be one.'
    exit 1
  fi

  success "Using the \"${GIT_BRANCH}\" branch."
  linefeed
}

# Checks whether the given branch exists and echos a non-empty string if present. Otherwise echos an empty string.
function branch_exists {
  git show-ref "refs/heads/$1"
}

# Switches to the given branch and pulls it.
function switch_and_pull {
  write "Switching to the $1 branch and pulling it …"
  git switch "$1"
  git pull
  success 'Done.'
  linefeed
}

# Runs "git remote prune origin".
function prune {
  write 'Pruning …'
  git remote prune origin
  success 'Done.'
  linefeed
}
