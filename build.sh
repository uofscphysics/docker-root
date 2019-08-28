#!/usr/bin/env bash
DOCKER_FILES=$(find build -type d -print | cut -d'/' -f2 | grep -v build | sort)
export DOCKER_BUILDKIT=1
docker --version

for name in ${DOCKER_FILES}; do
    # Skip root because it takes too long to build on travis
    if [ "$name" == "root" ]; then
        continue;
    fi
    echo -e "Building \e[32m${name} \e[39m"
    docker build -t uofscphysics/$name -f build/$name/Dockerfile build/$name/.;
    #docker push uofscphysics/$name;
done;