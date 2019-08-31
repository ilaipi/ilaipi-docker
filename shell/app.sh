#! /bin/bash

repoName=$NODE_REPO_NAME

_update() {
  echo 'update begin'
  cd repo
  git checkout .
  git pull
  yarn
  yarn run compile
  echo 'update done'
  cd -
}

eval $1
