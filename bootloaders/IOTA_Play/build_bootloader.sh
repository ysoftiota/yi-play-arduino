#!/bin/bash -ex

BASE=${HOME}/.arduino15/packages/arduino/hardware/samd/1.6.11/bootloaders/zero

trap 'RETVAL=$?; set +e; cd $PD; rm -rf "$TMPDIR"; exit $RETVAL' EXIT TERM INT

PD=`pwd`
TMPDIR=`mktemp -d /tmp/XXXXXXXXXXXX`

cp ${BASE}/* ${TMPDIR}

cp board* ${TMPDIR}
cd ${TMPDIR}

BOARD_ID=iota_play NAME=iota_play_boot make clean iota_play_boot.bin

cp iota_play_boot.bin $PD/../

echo Done building bootloaders!
