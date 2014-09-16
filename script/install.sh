#!/usr/bin/env bash

echo "Installing dependencies needed to build the sources and tests..."

ARDUINO_BASENAME="arduino-1.0.5"
ARDUINO_FILE="$ARDUINO_BASENAME-linux64.tgz"
ARDUINO_URL="http://arduino.googlecode.com/files/$ARDUINO_FILE"

AVR_GCC_BASENAME="arduino-1.5.7"
AVR_GCC_FILE="$AVR_GCC_BASENAME-linux64.tgz"
AVR_GCC_URL="http://downloads.arduino.cc/$AVR_GCC_FILE"

echo "Installing Arduino 1.0.5..."

wget "$ARDUINO_URL"
tar -xzf "$ARDUINO_FILE"
sudo mv "$ARDUINO_BASENAME/" "/usr/local/share/arduino"

echo "Installing avr-gcc from Arduino 1.5.7..."

wget "$AVR_GCC_URL"
tar -xzf "$AVR_GCC_FILE"
sudo mv "$AVR_GCC_BASENAME/hardware/tools/avr" "/usr/local/share/avr-gcc"

echo "Installtion of dependencies is complete, we are now going to run some tests..."

ls -la "/usr/local/share/avr-gcc/"
/usr/local/share/avr-gcc/ -v
