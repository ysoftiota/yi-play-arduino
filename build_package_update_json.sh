#!/bin/bash -e

function sha256calc()
{
	echo `sha256sum | awk '{print $1}'`
}

if [ "$1" ]; then
  VERSION=$1
else
  echo "Enter version and press enter key:"
  read VERSION
fi

if [ "$2" ]; then
  LINK=$2
else
  echo "Enter package URL and press enter key:"
  read LINK
fi

JSONFILE="package_iotaysoftcom_index.json"
ARCHIVE="YSoft-samd-${VERSION}.tar.gz"

# Check if both remote and local archive are the same
if [ `cat $ARCHIVE | sha256calc` != `wget $LINK -O - | sha256calc` ]; then
	echo "Archive checksums do not match"
	exit -1;
fi

# Prepare updated json file
cat > ${JSONFILE}.new << EOF
{
  "packages": [
    {
      "name": "YSoft",
      "maintainer": "Y Soft Corporation, a.s.", 
      "help": {
          "online": "https://github.com/ysoftiota/yi-play-arduino/"
      },
      "email": "info@ysoft.com", 
      "name": "Y Soft",
      "websiteURL": "https://github.com/ysoftiota/yi-play-arduino/",
      "platforms": [
        {
          "name": "Y Soft Boards",
          "architecture": "samd",
          "version": "${VERSION}",
          "category": "Partner",
          "url": "${LINK}",
          "archiveFileName": "`basename ${ARCHIVE}`",
          "checksum": "SHA-256:`cat ${ARCHIVE} | sha256calc`",
          "size": "`stat --printf="%s" ${ARCHIVE}`",
          "boards": [
            {"name": "Y Soft IOTA Play"}
          ],
          "toolsDependencies": [
            {
              "packager": "arduino",
              "name": "arm-none-eabi-gcc",
              "version": "4.8.3-2014q1"
            },
            {
              "packager": "arduino",
              "name": "bossac",
              "version": "1.7.0"
            },
            {
              "packager": "arduino",
              "name": "openocd",
              "version": "0.9.0-arduino"
            },
            {
              "packager": "arduino",
              "name": "avrdude",
              "version": "6.3.0-arduino8"
            },
            {
              "packager": "arduino",
              "name": "CMSIS",
              "version": "4.5.0"
            },
            {
              "packager": "arduino",
              "name": "CMSIS-Atmel",
              "version": "1.0.0"
            }
          ]
        }
      ],
      "tools": [
      ]
    }
  ]
}
EOF

# Update master JSON with new version
python ./build_package_update_json.py ${JSONFILE} ${JSONFILE}.new > ${JSONFILE}.newnew
mv ${JSONFILE}.newnew ${JSONFILE}
rm -f ${JSONFILE}.new

echo "Json updated OK"
