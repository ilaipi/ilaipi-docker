docker-compose exec lingdou acme.sh --issue --dns dns_ali -d '*.adouhealth.com' --standalone

docker-compose exec lingdou acme.sh --installcert -d '*.adouhealth.com' --key-file /etc/nginx/ssl/*.adouhealth.com.key  --fullchain-file /etc/nginx/ssl/*.adouhealth.com.fullchain.cer  --reloadcmd "echo success"
