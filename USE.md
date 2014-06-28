# Moti User Guide

## About

If I guess right, you just finished reading the [Installation guide](./INSTALL.md) and you're now ready to build your own code.


## Exemple: building a new behavior for Moti

Say we want to design a new behavior for Moti. How are we going to do that?

### 1. Create a new directory

We want a place to put our code. Opent the Terminal and type:

```Bash
$ cd /path/to/moti/src && mkdir new-project && cd $_ && touch new-project.ino && cp ../../arduino-mk/examples/MakefileExample/Makefile-example.mk Makefile
```

### 2. Write your code

In your favorite text editor (like Sublime Text 2), open `happyBehavior.ino`. You can use the following example if you want:

```C++
#define serial Serial

#include <Arduino.h>
#include "ChibiOS_AVR.h"
#include "Serial.h"
#include "Tools.h"

#include "Led.h"

Led sleep = Led(11, 12, 13);

static WORKING_AREA(waSleepThread, 1000);

static msg_t SleepThread(void *arg) {

	(void)arg;

	volatile uint8_t basePwm = 5; // divided by ten to have a wait delay higher than 1ms
	volatile uint8_t bpm = 35;     // must multiply by ten in heart.shine();
	volatile uint8_t R = 255;

	while (TRUE) {

		serial.println("Up");
		sleep.fade(1300, 0, 0, 0, 0, basePwm, R);

		serial.println("Down");
		sleep.fade(650, 0, 0, 0, 0, R, basePwm);

		chThdSleepMilliseconds(30000/ bpm);
	}
	return 0;
}

void chSetup() {
	chThdCreateStatic(waSleepThread, sizeof(waSleepThread),
		NORMALPRIO, SleepThread, NULL);
}


void setup() {
	serial.begin(115200);
	chBegin(chSetup);
	while(1) {
	}
}

void loop() {
	// nothing to do here
}
```

Save your file.

### 3. Configure the `Makefile`

Read the `Makefile` and change what you need to change. On OS X, you need to change: `BOARD_TAG`, `PROJECT_DIR` and `MONITOR_PORT`.

###5. Compile and upload

In your Terminal, type `make` to compile your code.

To upload, type `make upload`.

###6. Enjoy your robot!

You can now play with your robot.
