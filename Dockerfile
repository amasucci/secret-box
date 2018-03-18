FROM alpine:3.5

RUN addgroup SecretBOX && \
    adduser -D -G SecretBOX SecretBOX && \
    apk add --no-cache openssl

COPY entrypoint.sh /entrypoint.sh
COPY ./vaults/ /vaults

RUN chown -R SecretBOX:SecretBOX /vaults && chown SecretBOX:SecretBOX /entrypoint.sh

USER SecretBOX

ENTRYPOINT ["/entrypoint.sh"]