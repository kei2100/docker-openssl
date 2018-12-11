docker-openssl
===

```
docker build -t kei2100/openssl .
docker run -it -v $(pwd)/etc/ssl:/etc/ssl kei2100/openssl:latest \
 openssl req -new -keyout ./CA/private/cakey.pem -out ./CA/careq.pem
```

## Examples
```
# Create CA
docker run -it -v $(pwd)/etc/ssl:/etc/ssl kei2100/openssl:latest \
  openssl req -new -keyout ./CA/private/cakey.pem -out ./CA/careq.pem

touch ./etc/ssl/CA/db/index.txt
docker run -it -v $(pwd)/etc/ssl:/etc/ssl kei2100/openssl:latest \
  openssl ca -days 3650 -selfsign -create_serial -in ./CA/careq.pem -out ./CA/cacert.pem -extensions ca_ext     

# Create Server Cert
docker run -it -v $(pwd)/etc/ssl:/etc/ssl kei2100/openssl:latest \
  openssl req -new -keyout ./server/private/servkey.pem -out ./server/servreq.pem

docker run -it -v $(pwd)/etc/ssl:/etc/ssl kei2100/openssl:latest \
  openssl ca -days 3650 -in ./server/servreq.pem -out ./server/servcert.pem -extensions server_ext

docker run -it -v $(pwd)/etc/ssl:/etc/ssl kei2100/openssl:latest \
  openssl rsa -in ./server/private/servkey.pem -out ./server/private/servkey-nopass.pem  

# Create Client Cert
docker run -it -v $(pwd)/etc/ssl:/etc/ssl kei2100/openssl:latest \
 openssl req -new -keyout ./client/private/clikey.pem -out ./client/clireq.pem

docker run -it -v $(pwd)/etc/ssl:/etc/ssl kei2100/openssl:latest \
  openssl ca -days 3650 -in ./client/clireq.pem -out ./client/clicert.pem -extensions client_ext  

docker run -it -v $(pwd)/etc/ssl:/etc/ssl kei2100/openssl:latest \
  openssl rsa -in ./client/private/clikey.pem -out ./client/private/clikey-nopass.pem
```
