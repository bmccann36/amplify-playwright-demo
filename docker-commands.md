

aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/j4d9h2z3

## build (need buildx if you are on arm architecture)
docker buildx build --platform linux/amd64 -t grnspk-build-img .

## run local (for testing)
docker run --rm -it -v "$(pwd):/app" amplify-custom /bin/bash

## tag
docker tag grnspk-build-img:latest public.ecr.aws/j4d9h2z3/grnspk-build-img:latest

## publish
docker push public.ecr.aws/j4d9h2z3/grnspk-build-img:latest
