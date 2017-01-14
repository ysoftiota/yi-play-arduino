#!/bin/bash -e

if [ "$1" ]; then
  VERSION=$1
else
  echo "Enter version and press enter key:"
  read VERSION
fi

JSONFILE="package_iotaysoftcom_index.json"
ARCHIVE="YSoft-samd-${VERSION}.tar.gz"
IGNOREFILES="build_package* .git* ${JSONFILE}* *.gz"

if [ ! -e ${ARCHIVE} ]; then
    tar `for i in $IGNOREFILES; do echo -n "--exclude=./$i "; done` -czf ${ARCHIVE} .
fi

echo "Build OK"
