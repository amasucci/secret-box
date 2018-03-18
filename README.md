# SecretBOX

SecretBOX is a simple secret management tool based on OpenSSL and Docker. SecretBOX combines the strenght of Advanced Encryption Standard (or AES) and the flexibility of Docker.

The idea is to store your passwords as encrypted values in a Docker image, in this way you can always have access to the secrets by simply running `docker run -it secret-box $secret_name $encryption_password`.
Values are AES-256 encrypted using OpenSSL and it is considered secure.

## How to use it
Encrypt values:

```bash
$bash <> ./encrypt.sh
Secret name: mysql_password
Secret to encrypt: ********
Encryption password: ********
$bash <>
```

Build the Docker image:

```bash
$bash <> ./build_docker_image.sh
Sending build context to Docker daemon  10.24kB
Step 1/7 : FROM alpine:3.5
 ---> f658b09cdc6c
Step 2/7 : RUN addgroup SecretBOX && adduser -D -G SecretBOX SecretBOX && apk add --no-cache openssl
 ---> Using cache
 ---> 47cfeba417e3
Step 3/7 : COPY entrypoint.sh /entrypoint.sh
 ---> Using cache
 ---> ab2583a8aa2f
Step 4/7 : COPY ./vaults/ /vaults
 ---> Using cache
 ---> 20594007fe4a
Step 5/7 : RUN chown -R SecretBOX:SecretBOX /vaults && chown SecretBOX:SecretBOX /entrypoint.sh
 ---> Running in 2da3b67f7b47
Removing intermediate container 2da3b67f7b47
 ---> 2bc631e7e8af
Step 6/7 : USER SecretBOX
 ---> Running in a5bf858e8558
Removing intermediate container a5bf858e8558
 ---> 8b9bde2ee1c5
Step 7/7 : ENTRYPOINT ["/entrypoint.sh"]
 ---> Running in f8793935d3c4
Removing intermediate container f8793935d3c4
 ---> 0efa296aa899
Successfully built 0efa296aa899
Successfully tagged secret-box:b1
Successfully tagged secret-box:latest
$bash <>
```

To decrypt run:

```bash
$bash <> export decryption_password=super_secret_password
$bash <> docker run --rm secret-box mysql_password ${decryption_password}
P455W0Rd_!
```