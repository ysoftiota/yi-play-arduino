#!/bin/bash

VERSION="0.0.1"
RELEASE="YSoft-samd-$VERSION.tar.gz"
RELEASE_DIR="../yi-play-arduin-release/"

REMOVE_FILES="build_package.sh package_iotaysoftcom_index.json"

echo "Building package $VERSION"

rm -rf ${RELEASE_DIR}/*
mkdir -p ${RELEASE_DIR}
cp -r * ${RELEASE_DIR}

for f in $REMOVE_FILES
do
    rm -rf ${RELEASE_DIR}/$f
done

tar -czf $RELEASE -C $RELEASE_DIR .

echo "Done $RELEASE"
shasum -a 256 $RELEASE
