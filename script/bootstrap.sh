#!/usr/bin/env bash

SCRIPTS_DIR=$(dirname -- $(readlink -fn -- "$0"))

CWD=$(realpath "$SCRIPTS_DIR/..")
SRC="$CWD/src"
TEST="$CWD/test"
ARDMK="$CWD/Arduino-Makefile"

AVR_GCC="/usr/local/share/avr-gcc"
ARDUINO="/usr/local/share/arduino"

source "$SCRIPTS_DIR/install.sh"
