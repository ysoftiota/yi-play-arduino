# [YSoft IOTA Play](https://github.com/ysoftiota/yi-play) board support for Arduino IDE

## How to start developing
1. Download and install Arduino IDE from https://www.arduino.cc/en/Main/Software
2. Start the IDE and in File -> Preferences enter "Additional Boards Manager URL" - https://raw.githubusercontent.com/ysoftiota/yi-play-arduino/master/package_iotaysoftcom_index.json
3. Open Tools -> Board -> Boards manager
4. Install Support for Arduino SAMD Boards
5. Install Y Soft Boards 
6. Run the following sctipt to install USB drivers
`C:\Users\<your user name>\AppData\Local\Arduino15\packages\YSoft\hardware\samd\<version>\post_install.bat`
7. Select the YSoft IOTA Play board from the board menu:
8. Done

## Troubleshooting
### De-bricking procedure
It may happen that the user program will stop responding and it will not be possible to upload any more sketches. If that occurs then do the following

1. Press reset button twice within 0.5s  The bootloader will start and you can use Arduino IDE to download program.
1. If the double tap reset procedure does not help then connect teh ATMEL ICE debugger to the debug port, select YSoft IOTA Play target and burn again boot loader in tools menu.

## How to release new package
1. Get the source code - `git clone git@github.com:ysoftiota/yi-play-arduino.git`
1. Get libraries source code - `git submodule init; git submodule update`
1. Build the package - `./build_package.sh`
1. Draft a release on GitHub - https://github.com/ysoftiota/yi-play-arduino/releases/new
1. Enter tag, version and description
1. Attach package produced by *build_package.sh* script
1. Save draft
1. Edit *package_iotaysoftcom_index.json*
  * url - package attached to the release url (e.g. https://github.com/ysoftiota/yi-play-arduino/files/705885/YSoft-samd-0.0.1.tar.gz)
  * checksum - SHA 256 checksum produced by *build_package.sh* script (e.g. SHA-256:f905684b7ca4b99f9d1dfa0094b0fe283adc2d677a99c3a982deb752381913f1)
  * version
  * size - package size in bytes
1. Push new *package_iotaysoftcom_index.json*
1. Edit release draft on GitHub and publish it
1. :house_with_garden:
