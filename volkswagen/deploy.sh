#! /bin/bash

git clone git@github.com:ilaipi/volkswagen-puppet.git

cd volkswagen-puppet

cp env.example .env

docker-compose up -d
