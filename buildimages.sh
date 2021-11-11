#!/bin/bash
set -e

TAG=$1

IMAGE_NAME=${TRANSCROBES_DOCKER_REPO:-transcrobes}/corenlp-chinese:$TAG
buildah bud --format docker --pull --build-arg CORENLP_VERSION=$TAG --no-cache --squash -t ${IMAGE_NAME} -f Dockerfile .
buildah push -D --format docker ${IMAGE_NAME}
