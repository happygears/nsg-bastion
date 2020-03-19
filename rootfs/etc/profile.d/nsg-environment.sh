#!/bin/bash

set -a
if test -z "$LC_SSH_USER" -a -n "$USER"; then
  LC_SSH_USER=$USER
fi
if test -z "$GIT_AUTHOR_NAME"; then
  GIT_AUTHOR_NAME=$LC_SSH_USER
  GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
fi
if test -z "$GIT_AUTHOR_EMAIL"; then
  GIT_AUTHOR_EMAIL=$LC_SSH_USER
  GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
fi