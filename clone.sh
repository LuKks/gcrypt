#!/bin/bash

if [ -z "${1}" ]; then
  echo "You must specify a remote source, for example:"
  echo "gcrypt clone git@github.com:user/repo.git"
  exit 1
fi

SRC_REPO=$1
FOLDER_PATH=$2

git clone gcrypt::$SRC_REPO $FOLDER_PATH
