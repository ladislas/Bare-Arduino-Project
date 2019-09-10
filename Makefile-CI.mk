### DISCLAIMER
### This is an example Makefile and it MUST be configured to suit your needs.
### For detailed explanations about all the available options,
### please refer to https://github.com/sudar/Arduino-Makefile/blob/master/arduino-mk-vars.md

### PROJECT_DIR
### This is the path to where you have created/cloned your project
# PROJECT_DIR       = // set by calling make
#
### ARDMK_DIR
### Path to the Arduino-Makefile directory.
ARDMK_DIR         = $(PROJECT_DIR)/Arduino-Makefile

### ARDUINO_DIR

### Path to the Arduino application and ressources directory.
# ARDUINO_DIR       = // set by calling make

### USER_LIB_PATH
### Path to where the your project's libraries are stored.
# USER_LIB_PATH     := $(PROJECT_DIR)/lib
USER_LIB_PATH    :=  $(realpath $(PROJECT_DIR)/lib)

### BOARD_TAG
### It must be set to the board you are currently using. (i.e uno, mega2560, etc.)
BOARD_TAG         = mega
BOARD_SUB         = atmega2560

### MONITOR_PORT
### The port your board is connected to. Using an '*' tries all the ports and finds the right one.
MONITOR_PORT      = /dev/tty.usbmodem*

### MONITOR_BAUDRATE
### It must be set to Serial baudrate value you are using.
MONITOR_BAUDRATE  = 115200

### AVR_TOOLS_DIR
### Path to the AVR tools directory such as avr-gcc, avr-g++, etc.
# AVR_TOOLS_DIR     = // set by calling make

### AVRDUDE
### Path to avrdude directory.
AVRDUDE          = /usr/bin/avrdude

### CFLAGS_STD
CFLAGS_STD        = -std=gnu11

### CXXFLAGS_STD
CXXFLAGS_STD      = -std=gnu++11

### CPPFLAGS
### Flags you might want to set for debugging purpose. Comment to stop.
CXXFLAGS         += -pedantic -Wall -Wextra
LDFLAGS          += -fdiagnostics-color

### OBJDIR
### Don't touch this!
### This is were you put the binaries you just compile using 'make'
CURRENT_DIR       = $(shell basename $(CURDIR))
OBJDIR            = $(PROJECT_DIR)/build/$(CURRENT_DIR)/$(BOARD_TAG)

### path to Arduino.mk, inside the ARDMK_DIR, don't touch.
include $(ARDMK_DIR)/Arduino.mk
