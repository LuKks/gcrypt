#!/bin/bash

if [ -z "${1}" ]; then
  echo "You must specify a command, for example:"
  echo "gcrypt init ..."
  echo "gcrypt encrypt ..."
  echo "gcrypt clone ..."
  exit 1
fi

CMD=$1
shift

gcrypt-$CMD $@
