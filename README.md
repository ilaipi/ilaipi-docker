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
```
