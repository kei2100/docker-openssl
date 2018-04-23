docker-openssl
===

```
docker build -t kei2100/openssl .
docker run -it -v $(pwd)/etc/ssl:/etc/ssl kei2100/openssl:latest \
 openssl req -new -keyout ./CA/private/cakey.pem -out ./CA/careq.pem
```
