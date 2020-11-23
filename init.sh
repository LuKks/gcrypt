#!/bin/bash

if [ -z "${1}" ]; then
  echo "You must specify a remote source, for example:"
  echo "gcrypt init git@github.com:user/repo.git"
  exit 1
fi

SRC_REPO=$1
FOLDER_PATH=$2

git init $FOLDER_PATH
if [ -n "${FOLDER_PATH}" ]; then
	cd $FOLDER_PATH
fi
git remote add origin gcrypt::$SRC_REPO
git remote set-url origin gcrypt::$SRC_REPO
