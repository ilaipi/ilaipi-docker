#! /bin/bash

repo=$NODE_REPO_NAME

deploy() {
  rm -fr repo
  git clone git@github.com:ilaipi/$repo.git repo
  cd repo
  yarn
  yarn run compile
  cd -
}

# core: only clone
handleCore

deploy

boot() {
  cd repo
  node build/app.js
  cd -
}

eval $1
