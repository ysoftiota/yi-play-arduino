# YSoft IOTA Play board support for Arduino IDE

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
