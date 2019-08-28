#!/usr/bin/env bash
DOCKER_FILES=$(find build -type d -print | cut -d'/' -f2 | grep -v build)

for name in ${DOCKER_FILES}; do
    if [ "$name" == "root" ]; then
        continue;
    fi

    echo docker build -t uofscphysics/$name -f build/$name/Dockerfile build/$name/.;
done;