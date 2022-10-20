#!/bin/sh

set -e

if [ "$(id -u)" = "0" ]; then
  if [ -n "$UID" ] && [ ! "$UID" = "$(id python -u)" ]; then
    usermod -u "$UID" python
  fi

  if [ -n "$GID" ] && [ ! "$GID" = "$(id python -g)" ]; then
    groupmod -g "$GID" python
  fi

  chown python:python -R /var/lib/python

  if [ -d "/lib/entrypoint" ]; then
    run-parts -v --regex '.*sh$' /lib/entrypoint
  fi

  exec gosu python "$@"
else
  exec "$@"
fi

