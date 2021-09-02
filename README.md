端口分配记录

| 服务 | 端口 | 备注 |
| --- | :-: | :-: |
| nginx |  80 | http |
| nginx |  443 | https |
| 博客db |  55001 | mysql |
| 博客wp |  55002 | apache |
| volkswagen-helper db |  55003 | mongodb |


## Deploy

部署服务：nginx，博客(wordpress/mysql)



## Blog

```bash
cd blog && docker-compose up -d blog
```

## nginx

```bash
cd nginx && docker-compose up -d nginx
```

Tips: before up nginx, should issue and install the certificate by acme

## acme

```bash
# domain: *.ilaipi.top

# update cert
docker-compose exec acme-ilaipi acme.sh --issue --dns dns_ali -d '*.ilaipi.top' --standalone --force

docker-compose exec acme-ilaipi acme.sh --installcert -d '*.ilaipi.top' --key-file /etc/nginx/ssl/*.ilaipi.top.key  --fullchain-file /etc/nginx/ssl/*.ilaipi.top.fullchain.cer  --reloadcmd "echo success"

docker-compose exec nginx nginx -s reload
```

需要在系统自动任务中加入：

```bash
# 这里不能使用docker-compose  看日志这里有很多错误  所以直接使用docker命令来重新加载nginx
# 1 0 1,15 * * cd /home/ilaipi-docker/nginx && /usr/local/bin/docker-compose up -d --build nginx && /usr/local/bin/docker-compose exec nginx nginx -s reload
1 0 1,15 * * cd /path/to/nginx && docker exec -dit nginx nginx -s reload
```
