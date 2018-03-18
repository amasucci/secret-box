#!/usr/bin/env bash

set -eu

echo -n "Secret name: "
read secret_name
echo -n "Secret to encrypt: "
read -s secret
echo
echo -n "Encryption password: "
read -s password
echo

mkdir -p vaults
echo "${secret}" | openssl enc -a -e -aes-256-cbc -salt -k ${password} > ./vaults/${secret_name}
