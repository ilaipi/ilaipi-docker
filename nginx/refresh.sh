#! /bin/bash

cd /home/ilaipi-docker/nginx

cp /data/nginx/acme.sh-ilaipi/\*.ilaipi.top/fullchain.cer /data/nginx/ssl/*.ilaipi.top.fullchain.cer
cp /data/nginx/acme.sh-ilaipi/\*.ilaipi.top/\*.ilaipi.top.key /data/nginx/ssl/

/usr/local/bin/docker-compose restart nginx
