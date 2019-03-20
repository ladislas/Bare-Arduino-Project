#!/usr/bin/env bash

echo "Installing dependencies needed to build the sources and tests..."

ARDUINO_BASENAME="arduino-1.8.9"
ARDUINO_FILE="$ARDUINO_BASENAME-linux64.tar.xz"
ARDUINO_URL="https://downloads.arduino.cc/$ARDUINO_FILE"

echo "Downloading $ARDUINO_BASENAME from $ARDUINO_URL"
wget "$ARDUINO_URL" -O "$ARDUINO_FILE"

echo "Unzipping $ARDUINO_BASENAME"
tar xf "$ARDUINO_FILE"

echo "Installing avr-gcc to $AVR_GCC"
sudo mv "$ARDUINO_BASENAME/hardware/tools/avr" "$AVR_GCC"

echo "Install Arduino to $ARDUINO"
sudo mv "$ARDUINO_BASENAME/" "$ARDUINO"

echo "Installation of dependencies is complete, we are now going to run some tests..."

source "$SCRIPTS_DIR/runtests.sh"

