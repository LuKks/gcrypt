#!/bin/bash

if [ -z "${1}" ]; then
  echo "You must specify a remote source, for example:"
  echo "gcrypt encrypt git@github.com:user/repo.git"
  exit 1
fi

PREFIX="[GCRYPT]"
SRC_REPO=$1
BARE_REPO="/tmp/gcrypt-bare.git"
DEST_REPO="/tmp/gcrypt-dest.git"

echo "$PREFIX clone source"
git clone $SRC_REPO $DEST_REPO || exit 1
cd $DEST_REPO

echo "$PREFIX create bare repo"
git init --bare $BARE_REPO

echo "$PREFIX encrypt source and move to bare repo"
for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master `; do
  git branch --track ${branch#remotes/origin/} $branch
done
git remote add encrypting gcrypt::$BARE_REPO
git push --all --force encrypting
git push --tags encrypting

echo "$PREFIX overwrite remote source"
cd $BARE_REPO
git remote add origin $SRC_REPO
git push --all --force

echo "$PREFIX back to source and delete other remote branches"
cd $DEST_REPO
git branch -r | grep 'origin' | grep -v 'master$' | grep -v HEAD | cut -d/ -f2- | while read line; do git push origin :heads/$line; done;
git tag | xargs -L 1 | xargs git push origin --delete

echo "$PREFIX delete temp repos"
rm -rf $BARE_REPO
rm -rf $DEST_REPO
echo "Temporal repositories deleted"
