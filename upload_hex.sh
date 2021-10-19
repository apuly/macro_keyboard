#!/bin/sh
# 
# File:   upload_hex.sh
# Author: paul
#
# Created on Oct 19, 2021, 11:09:45 AM
# Contains the command for uploading the compiles hex to the microcontroller
# This assumes that the hex is uploaded to the default place in the file
# file structure and that the microcontroller is a atmega328p (same as arduino
# Uno)

avrdude -C/home/paul/.avr/avrdude.conf -v -patmega328p -carduino -P/dev/ttyACM0 -b57600 -e -Uflash:w:/home/paul/Documenten/Programming/macro_keyboard/dist/default/production/macro_keyboard.production.hex:i