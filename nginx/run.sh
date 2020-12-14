docker-compose exec acme-ilaipi acme.sh --issue --dns dns_ali -d '*.ilaipi.top' --standalone

docker-compose exec acme-ilaipi acme.sh --installcert -d '*.ilaipi.top' --key-file /etc/nginx/ssl/*.ilaipi.top.key  --fullchain-file /etc/nginx/ssl/*.ilaipi.top.fullchain.cer  --reloadcmd "echo success"
