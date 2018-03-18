#!/usr/bin/env sh

set -eu

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <Secret Name> <Decryption Password>"
    exit 1
fi

secret_name=$1
password=$2

cat /vaults/${secret_name} | openssl enc -a -d -aes-256-cbc -salt -k ${password}
