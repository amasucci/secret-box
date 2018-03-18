#!/usr/bin/env bash

set -eu

docker build . -t secret-box:b${build_version} -t secret-box:latest