#!/bin/bash -e

if [ "$1" ]; then
  VERSION=$1
else
  echo "Enter version and press enter key:"
  read VERSION
fi

BUILDDIR="build"
JSONFILE="package_iotaysoftcom_index.json"
ARCHIVE="YSoft-samd-${VERSION}.tar.gz"
IGNOREFILES="$BUILDDIR build_package* .git* ${JSONFILE}* *.gz"
DRIVERSARCHIVE="YSoft-drivers-${VERSION}.zip"

if [ ! -e "$BUILDDIR" ];then
    mkdir $BUILDDIR
fi

if [ ! -e ${ARCHIVE} ]; then
    tar `for i in $IGNOREFILES; do echo -n "--exclude=./$i "; done` -czf $BUILDDIR/${ARCHIVE} .
fi

if [ ! -e ${DRIVERSARCHIVE} ]; then
    zip -r $BUILDDIR/$DRIVERSARCHIVE drivers
fi

echo "Build OK"
