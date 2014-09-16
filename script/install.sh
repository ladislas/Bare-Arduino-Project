#!/usr/bin/env bash

echo "Installing dependencies needed to build the sources and tests...\n"

ARDUINO_BASENAME="arduino-1.0.5"
ARDUINO_FILE="$ARDUINO_BASENAME-linux64.tgz"
ARDUINO_URL="http://arduino.googlecode.com/files/$ARDUINO_FILE"

AVR_GCC_BASENAME="arduino-1.5.7"
AVR_GCC_FILE="$AVR_GCC_BASENAME-linux64.tgz"
AVR_GCC_URL="http://downloads.arduino.cc/$AVR_GCC_FILE"

echo "Installing Arduino 1.0.5...\n"

wget -q "$ARDUINO_URL"
tar -xzf "$ARDUINO_FILE"
sudo mv "$ARDUINO_BASENAME/" "$ARDUINO"

echo "Installing avr-gcc from Arduino 1.5.7..."

wget -q "$AVR_GCC_URL"
tar -xzf "$AVR_GCC_FILE"
sudo mv "$AVR_GCC_BASENAME/hardware/tools/avr" "$AVR_GCC"

echo "Installation of dependencies is complete, we are now going to run some tests...\n"

source "$SCRIPTS_DIR/runtests.sh"
