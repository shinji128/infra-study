#!/bin/bash
set -euxo pipefail

ecr_uri=104677021039.dkr.ecr.ap-northeast-1.amazonaws.com/infra-study
tag=latest

# TODO: env を CLI 経由などで取得する
docker build --progress=plain -t $ecr_uri:$tag --platform=linux/arm64 .

aws ecr get-login-password --profile miura --region ap-northeast-1 | docker login --username AWS --password-stdin 104677021039.dkr.ecr.ap-northeast-1.amazonaws.com
docker push $ecr_uri:$tag
