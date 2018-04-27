#!/usr/bin/env bash

set -e
set -x

source config.sh

docker build  --no-cache -t ${REGISTRY}/dubbo:admin ./

docker push ${REGISTRY}/dubbo:admin